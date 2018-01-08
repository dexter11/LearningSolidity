

pragma solidity ^0.4.0;

contract MyCoin{
    
    address admin;
    mapping(address=>uint) balance;
    
    function MyCoin(){
        admin = msg.sender;
    }
    
    function sendCoin(uint amount,address receiver){
        if(msg.sender==admin){
            balance[receiver] += amount;        
        }
        else{
            throw;
        }
    }
    
    function checkBalance() returns (uint){
        return balance[msg.sender];
    }
}
