// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Calculator {
    uint public result;

    function add(uint a, uint b) public returns (uint){
        result = a + b;
        // Double check results
        assert(result > a);
        return result;
    }

    function subtract(uint a, uint b) public returns (uint) {
        result = a - b;
        // Double check results
        assert(result < a);
        return result;
    }

    function multiply(uint a, uint b) public returns (uint) {
        result = a * b;
        // Double check results
        assert(b == 0 || result / b == a);
        return result;
    }

    function divide(uint a, uint b) public returns (uint){
        require(b != 0, "Cannot divide by zero!");
        // Since there are no floats, check if divisible
        require(a % b == 0, "Numbers must be divisible!");
        result = a / b;
        // Double check results
        assert(result * b == a);
        return result;
    }

    function isZero() public view {
        if (result == 0) {
            revert("The result is zero.");
        }
    }
}
