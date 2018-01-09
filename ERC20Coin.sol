pragma solidity ^0.4.0;

contract ERC20Coin{
    mapping(address => uint) balances;
    uint supply = 1000; //to keep the supply of coins fixed
    address master;
    mapping(address => mapping(address => uint)) approved; 
    
    function Erc20Coin() public{
        master = msg.sender;  //master variable stores the network address when the contract gets deployed in the network 
    }
    
    //ERC20 standard function to show the available supply of coins
    function totalSupply() public constant returns(uint){
        return supply;
    }
    
    //Custom function to mint coins.Only 'master' i.e. the creator can mint coins for his/her own address
    function mint(uint noOfCoins) public{
        if(msg.sender == master && noOfCoins <= supply){
            balances[msg.sender] += noOfCoins;
            supply -= noOfCoins;
        }
        else{
            throw;
        }
    }
    //ERC20 standard function to check balance 
    function balanceOf(address tokenOwner) public constant returns (uint balance){
        return balances[tokenOwner];
    }
    //ERC20 standard function to transfer coins from one address to another
    function transfer(address to, uint tokens) public returns (bool success){
        if(balances[msg.sender] >= tokens && tokens > 0){
            balances[to] += tokens;
            balances[msg.sender] -= tokens;
            return true;
        }
        return false;
    }
    //ERC20 standard function to approve someone to spend specefic amount of coins on thier behalf 
    function approve(address spender, uint tokens) public returns (bool success){
        if(balances[msg.sender] > tokens){
            approved[msg.sender][spender] = tokens;
            return true;
        }
        return false;
    }
    //ERC20 standard function to show the approved amount of allowance for a spender 
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining){
        if(balances[tokenOwner] < approved[tokenOwner][spender]){ //If owner has already exhausted the coins and does not have
            approved[tokenOwner][spender] = 0;                    //sufficient balance for spender then the approved amount/allowance 
            return approved[tokenOwner][spender];                 //gets nullified 
        }
        return approved[tokenOwner][spender];
    }
    //ERC20 standard function to allow spender to transfer allowed amount of coins to others 
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        if(balances[from] >= tokens && approved[from][msg.sender] >= tokens && tokens > 0){
            balances[to] += tokens;
            balances[from] -= tokens;
            approved[from][msg.sender] -= tokens;
            return true;
        }
        return false;
    }
}
