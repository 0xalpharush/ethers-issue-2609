// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {ERC20Mock} from "lib/solady/ext/woke/ERC20Mock.sol";

contract CounterTest is Test {
    Counter public counter;
    ERC20Mock public token;
    function setUp() public {
        token = new ERC20Mock("Token A", "TA", 18);
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
