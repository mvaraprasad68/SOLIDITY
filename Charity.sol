pragma solidity ^0.8.0;
contract Charity
{
address payable public owner;
event donationReceived(address member,uint256 amount);
event donationWithdrawn(address member,uint256 amount);
constructor()
{
owner=payable(msg.sender);
}
function donate() payable public
{
require(msg.value>0,"Donation must be greater than zero ");
emit donationReceived(msg.sender,msg.value);
}
function balance() payable public returns(uint256)
{
return address(this).balance;
}
function withdraw() public 
{
require(msg.sender==owner,"Owner can only withdraw");
uint balance=address(this).balance;

owner.transfer(balance);
emit donationWithdrawn(msg.sender,balance);
}
}