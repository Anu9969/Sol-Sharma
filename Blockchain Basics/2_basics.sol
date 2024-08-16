// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;

contract Test {
    uint public state_var ;
    constructor() {
         state_var = 52;
    }
    function getResult() public view returns (uint) {
        uint local_var = 66;
        uint result = state_var + local_var;
        return  result;
    }
    
}