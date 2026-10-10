pragma solidity ^0.8.0;
contract Bank
{
address payable public owner;
uint public balance;
event deposit(address depositor,uint256 amount);
event withdraw(address owner,uint256 amount);
constructor()
{
owner=payable(msg.sender);
}
function deposits() payable public
{
require(msg.value>0,"Deposit amount should be greater than zero");
balance=balance+msg.value;
emit deposit(msg.sender,msg.value);
}
function withdraws(uint256 amount) public 
{
require(msg.sender==owner,"Owner can only withdraw");
require(amount<=balance,"Insufficient funds");
balance=balance-amount;
owner.transfer(amount);
emit withdraw(msg.sender,amount);
}

}