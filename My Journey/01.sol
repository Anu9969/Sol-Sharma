// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;

contract Calculator {
    uint256 result = 0;

    function add(uint256 num) public {
        result += num;
    }

    function subtract(uint24 num) public{
        result -= num;
    }

    function multiply (uint136 num) public{
        result *= num;
    }

    function divide(uint256 num ) public {
        result /= num;
    }

    function get() public view returns(uint){
        return result;
    }
}