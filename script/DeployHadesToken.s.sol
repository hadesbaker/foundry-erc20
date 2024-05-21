// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {HadesToken} from "../src/HadesToken.sol";

contract DeployHadesToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;
    function run() external returns (HadesToken) {
        vm.startBroadcast();
        HadesToken ht = new HadesToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ht;
    }
}
