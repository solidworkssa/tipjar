// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/TipJar.sol";

contract TipJarTest is Test {
    TipJar public c;
    
    function setUp() public {
        c = new TipJar();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
