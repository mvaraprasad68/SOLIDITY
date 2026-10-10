pragma solidity ^0.8.0;
contract Election
{
struct candidate
{
string name;
uint votes;
}
candidate[] public candidates;
mapping(address=>bool) public hasvoted;
event votecast(address voter,uint id);
function addCandidate(string memory name) public
{
candidates.push(candidate(name,0));
}
function vote(uint id) public
{
require(!hasvoted[msg.sender],"Already Voted");
require(id<candidates.length,"Invalid Candidate");
hasvoted[msg.sender]=true;
candidates[id].votes++;
emit votecast(msg.sender,id);
}
function winner() public view returns(string memory)
{
if(candidates.length==0)
{
return "No candidates";
}
uint max=0;
uint king=0;
for(uint i=0;i<candidates.length;i++)
{
if(candidates[i].votes>max)
{
max=candidates[i].votes;
king=i;
}
}
return candidates[king].name;
}

}