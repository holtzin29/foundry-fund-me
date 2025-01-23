// SPDX-License-Identifier: MIT

// fund script and withdraw scripts to actually interact with the contract

pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentDeployed) public {
        FundMe(payable(mostRecentDeployed)).fund{value: SEND_VALUE}();

        console.log("Funded FundMe contract with ", SEND_VALUE);
    }

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        WithdrawFundMe(mostRecentDeployed).withdrawFundMe(mostRecentDeployed);
        vm.stopBroadcast();
    }
} // interaction tests are done to test the interaction of the contract with the blockchain

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).cheaperWithdraw();
        vm.stopBroadcast();

        console.log("Withdrew funds from FundMe contract");
    }

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        withdrawFundMe(mostRecentDeployed);
        vm.stopBroadcast();
    }
}
