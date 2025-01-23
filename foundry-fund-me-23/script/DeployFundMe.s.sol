// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    address ethUsdPriceFeed;

    function run() external returns (FundMe) {
        // to run a script in the console, you need to have a run function
        // before broadcast = not a real transaction

        HelperConfig helperConfig = new HelperConfig();
        ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        // after broadcast = real transaction

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
