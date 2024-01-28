// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console2} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    Token public token;
    string name = "Test Token";
    string symbol = "TTK";
    uint256 totalSupply = 1000;

    function setUp() public {
        token = new Token(name, symbol, totalSupply);
    }

    /////////////////////////
    ///// TEST VARIABLE /////
    /////////////////////////
    function test_nameToken() public {
        assertEq(token.name(), name);
    }

    function test_symbolToken() public {
        assertEq(token.symbol(), symbol);
    }

    function test_totalSupplyToken() public {
        assertEq(token.totalSupply(), totalSupply * (10 ** 18));
    }
}
