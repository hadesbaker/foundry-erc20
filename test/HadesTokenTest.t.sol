// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployHadesToken} from "../script/DeployHadesToken.s.sol";
import {HadesToken} from "../src/HadesToken.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

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

    function testInitialSupply() public {
        assertEq(hadesToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, hadesToken.balanceOf(twix));
    }

    function testUsersCantMint() public {
        vm.expectRevert();
        MintableToken(address(hadesToken)).mint(address(this), 1);
    }

    function testAllowancesWorks() public {
        uint256 intialAllowance = 1000;

        vm.prank(twix);
        hadesToken.approve(carti, intialAllowance);

        uint256 transferAmount = 500;

        vm.prank(carti);
        hadesToken.transferFrom(twix, carti, transferAmount);

        // Assert
        assertEq(hadesToken.balanceOf(carti), transferAmount);
        assertEq(hadesToken.balanceOf(twix), STARTING_BALANCE - transferAmount);
    }
}
