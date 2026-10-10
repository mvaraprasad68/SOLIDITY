pragma solidity ^0.8.0;
contract Bidding
{
string public hname;
uint public hamount=0;
address public haddress;

uint constant minbid=1000;
uint public endtime;
constructor(uint duration)
{
endtime=block.timestamp+duration;
}

function bid(string memory name, uint amount) public
{
require(block.timestamp<endtime,"Bidding ended");
require(amount>=minbid,"Place Min Bid");
require(amount>hamount,"Less than highest Bid");
hname=name;
hamount=amount;
haddress=msg.sender;
}
function winner() public view returns(string memory)
{
require(block.timestamp>=endtime,"Bidding is not ended");
if(hamount==0)
{
return "No Bidders";
}
return hname;
}
}