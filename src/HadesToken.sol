// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
 * @title A HadesToken StableCoin
 * @author Taki Baker Alyasri
 * @notice This contract creates a basic OpenZeppelin ERC20 token
 * @dev The deployment script DeployHadesToken assigns the token's initial value via the constructor
 */
contract HadesToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("HadesToken", "HTK") {
        _mint(msg.sender, initialSupply);
    }
}
