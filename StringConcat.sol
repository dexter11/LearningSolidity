pragma solidity ^0.4.0;

//String concatenation in Solidity 
library Strings{
    function concat(string _base,string _value) internal returns (string){
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory tempString = new string(_baseBytes.length + _valueBytes.length);
        bytes memory newString = bytes(tempString);
        
        uint i;
        uint j;
        
        for(i=0;i<_baseBytes.length;i++){
            newString[j++] = _baseBytes[i];
        }
        
        for(i=0;i<_valueBytes.length;i++){
            newString[j++] = _valueBytes[i];
        }
        
        return string(newString);
    }
}

contract TestString{
    using Strings for string;
    
    function testConcat(string _base) public returns(string){
        return _base.concat("suffix");
    }
}
