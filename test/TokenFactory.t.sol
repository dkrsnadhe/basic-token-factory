// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console2} from "forge-std/Test.sol";
import {TokenFactory} from "../src/TokenFactory.sol";

contract TokenFactoryTest is Test {
    TokenFactory public tokenFactory;

    function setUp() public {
        tokenFactory = new TokenFactory();
    }

    /////////////////////////
    ///// TEST FUNCTION /////
    /////////////////////////
    function test_createToken() public {
        string memory name1 = "Test Token";
        string memory symbol1 = "TTK";
        uint256 totalSupply1 = 1000;
        tokenFactory.createToken(name1, symbol1, totalSupply1);

        string memory name2 = "Nice Token";
        string memory symbol2 = "NTK";
        uint256 totalSupply2 = 5000;
        tokenFactory.createToken(name2, symbol2, totalSupply2);

        address tokenAddressDeployed1 = tokenFactory.deployedTokens(0);
        address tokenAddressDeployed2 = tokenFactory.deployedTokens(1);
        assertEq(tokenFactory.deployedTokens(0), tokenAddressDeployed1);
        assertEq(tokenFactory.deployedTokens(1), tokenAddressDeployed2);
    }

    function test_getTokenData() public {
        string memory name = "Test Token";
        string memory symbol = "TTK";
        uint256 totalSupply = 1000;
        tokenFactory.createToken(name, symbol, totalSupply);

        address tokenAddressDeployed = tokenFactory.deployedTokens(0);

        (
            string memory _nameToken,
            string memory _symbolToken,
            uint256 _totalSupplyToken
        ) = tokenFactory.getTokenData(tokenAddressDeployed);

        assertEq(_nameToken, name);
        assertEq(_symbolToken, symbol);
        assertEq(_totalSupplyToken, totalSupply * (10 ** 18));
    }
}
