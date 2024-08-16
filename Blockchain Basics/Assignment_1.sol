// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.26;

contract Assignment1 {
    uint public publicVar = 10;
    uint private privateVar = 6;
    uint internal internalVar = 3;

    function arithmetic() public view returns (uint, uint, uint, uint, uint) {
        uint add = publicVar + 5;
        uint sub = publicVar - 5;
        uint mul = publicVar * 5;
        uint divide = publicVar / 5;
        uint modulo = publicVar % 5;

        return (add, sub, mul, divide, modulo);
    }

    function relational() public view returns (bool, bool, bool, bool, bool) {
        bool equal = privateVar == publicVar;
        bool unequal = privateVar != publicVar;
        bool greater = privateVar > publicVar;
        bool smaller = privateVar < publicVar;
        bool greaterEqual = privateVar >= publicVar;
        
        return (equal, unequal, greater, smaller, greaterEqual);
    }

    function logical() public  view returns (bool, bool, bool) {
        bool a = publicVar > 5;
        bool b = privateVar < 5;
        bool and = a && b;
        bool or = a || b;
        bool not = !a;

        return (and, or, not);
    }
}
