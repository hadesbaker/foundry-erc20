// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployHadesToken} from "../script/DeployHadesToken.s.sol";
import {HadesToken} from "../src/HadesToken.sol";

contract HadesTokenTest is Test {
    HadesToken public hadesToken;
    DeployHadesToken public deployer;

    address twix = makeAddr("twix");
    address carti = makeAddr("carti");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployHadesToken();
        hadesToken = deployer.run();

        vm.prank(msg.sender);
        hadesToken.transfer(twix, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, hadesToken.balanceOf(twix));
    }
}
