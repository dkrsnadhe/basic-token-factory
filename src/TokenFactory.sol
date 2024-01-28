// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Token} from "./Token.sol";

contract TokenFactory {
    event CreateToken(
        address indexed _tokenAddress,
        string _name,
        string _symbol,
        uint256 _totalSupply
    );

    address[] public deployedTokens;

    function createToken(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) external {
        address newToken = address(new Token(_name, _symbol, _totalSupply));
        deployedTokens.push(newToken);
        emit CreateToken(address(newToken), _name, _symbol, _totalSupply);
    }

    function getTokenData(
        address _tokenAddress
    ) public view returns (string memory, string memory, uint256) {
        Token tokenInstance = Token(_tokenAddress);
        return (
            tokenInstance.name(),
            tokenInstance.symbol(),
            tokenInstance.totalSupply()
        );
    }
}
