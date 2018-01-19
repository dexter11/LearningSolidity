pragma solidity ^0.4.0;

//To find the position of a char in a given string
library StringsLib{
    function strpos(string _base,string _value) internal returns (int){
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        assert(_valueBytes.length == 1);
        
        for(uint i=0; i<_baseBytes.length; i++){
            if(_baseBytes[i] == _valueBytes[0]){
                return int(i);
            }
        }
        return -1;
    }
}

contract TestStringPos{
    using StringsLib for string;
    
    function testStrpos(string _base) public returns(int){
        return _base.strpos("s");
    }
}
