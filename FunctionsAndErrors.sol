// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BingkoinBank {
    address public owner = msg.sender;
    mapping(address => uint256) public balances;
    uint256 existing = 1000;

    constructor() {
        balances[msg.sender] = 100;
    }

    function burnCoin(uint256 amount) public {
        // Checks if the sender is the owner
        require(msg.sender == owner, "You do not own this account.");
        
        // Check if the sender has enough coins to burn
        require(balances[msg.sender] >= amount, "You do not have enough coins to burn.");

        // Keeps track of previous balances
        uint256 balanceBefore = balances[msg.sender];

        // Subtract the burned amount from the sender's balance
        balances[msg.sender] -= amount;
        existing -= amount;

        // Double check (internally) if the user's balance has been updated correctly
        assert(balances[msg.sender] == balanceBefore - amount);
    }

    function mintCoin(uint256 amount) public {
        if (msg.sender != owner) {
            revert("You must be an owner to mint coins.");
        }

        // Keeps track of previous balances
        uint256 balanceBefore = balances[msg.sender];

        // Add the minted amount to the sender's balance
        balances[msg.sender] += amount;
        existing += amount;

        if (!(balances[msg.sender] == balanceBefore + amount)) {
            revert("Transaction Failed");
        }
    }
}
