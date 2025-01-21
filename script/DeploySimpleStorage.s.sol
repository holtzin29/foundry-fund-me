// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol"; // importing to the forge library to say that this is a script
import {SimpleStorage} from "../src/SimpleStorage.sol"; // importing the contract that we want to deploy

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast(); // start the broadcast
        SimpleStorage simpleStorage = new SimpleStorage(); // deploy the contract
        vm.stopBroadcast(); // stop the broadcast
        return simpleStorage; // return the contract
    }
}
