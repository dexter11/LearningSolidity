pragma solidity ^0.4.0;

contract Transaction{
    event senderLogger(address);
    event valueLogger(uint);
    
    address private owner;
    
    function Transaction() public{
        owner = msg.sender;    
    }
    
    modifier isOwner{
        require(msg.sender == owner);
        _;
    }
    
    modifier isValidValue{
        assert(msg.value >= 1 ether);
        _;
    }
    
    function () payable public isOwner isValidValue{
        senderLogger(msg.sender);
        valueLogger(msg.value);
    }
}
