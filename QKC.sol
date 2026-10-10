pragma solidity ^0.8.0;
contract QKC
{
string public name="QuickNode Token";
string public symbol="QKC";
uint public decimals=2;

uint private totalsupply=100000;

mapping(address=>uint256) private balances;
mapping(address=>mapping(address=>uint256)) private allowed;

event transfer(address from,address to,uint256 tokens);
event approved(address owner,address spender,uint256 tokens);

constructor()
{
balances[msg.sender]=totalsupply;
emit transfer(address(0),msg.sender,totalsupply);
}

function totalsupplys() public view returns(uint256)
{
return totalsupply;
}

function balanceOf(address owner) public view returns(uint256)
{
return balances[owner];
}

function transfers(address to,uint256 tokens) public
{
require(to!=address(0),"Invalid Address");
require(balances[msg.sender]>=tokens,"Insufficient Funds");
balances[msg.sender]-=tokens;
balances[to]+=tokens;
emit transfer(msg.sender,to,tokens);
}

function approve(address spendor,uint256 tokens) public 
{
require(spendor!=address(0),"Invalid Address");
allowed[msg.sender][spendor]=tokens;
emit approved(msg.sender,spendor,tokens);
}

function allowance(address owner,address spendor) public returns(uint256)
{
return allowed[owner][spendor];
}

function transferfrom(address from,address to, uint256 tokens) public 
{
require(from!=address(0),"Invalid Address");
require(to!=address(0),"Invalid Address");
require(balances[from]>=tokens,"Insufficient Funds");
require(allowed[from][msg.sender]>=tokens,"Approved Limit Excceded");
balances[from]-=tokens;
balances[to]+=tokens;
allowed[from][msg.sender]-=tokens;
emit transfer(from,to,tokens);
}

}