// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10 ** 18);
    }
}
