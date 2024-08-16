// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;

contract Test
{
    uint public a;
    uint public b;
    uint public sum;  

    function set(uint x , uint y)public 
    {
        a = x;
        b= y;
        sum = a+b;
    }

    function get() public view returns (uint){
        return sum;
    }
}

