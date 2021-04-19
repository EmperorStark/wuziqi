pragma solidity ^0.6.2;

contract Wuziqi {
  address public owner;

  mapping (address => uint) public balances;

  constructor() public {
    owner = msg.sender;
  }

  function transfer(address to, uint amount) public {
    require(balances[msg.sender] >= amount, "Insufficient funds to transfer");
    balances[msg.sender] -= amount;
    balances[to] += amount;

  }

  function deposit() public payable {
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint amount) public {
    require(balances[msg.sender] >= amount, "Insufficent funds to withdraw");
    balances[msg.sender] -= amount;
    msg.sender.transfer(amount);
  }
}