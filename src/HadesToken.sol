// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HadesToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("HadesToken", "HTK") {
        _mint(msg.sender, initialSupply);
    }
}
