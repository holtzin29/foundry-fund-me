// SPDX-License-Identifier: MIT
// deploy mocks when we are in local anvil chain
// keep track of contract address different chain

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "@chainlink/contracts/src/v0.8/tests/MockV3Aggregator.sol";

contract HelperConfig is Script {
    // if we are in a local anvil we deploy mocks
    // otherwise grab the existing address from the live network
    // structs creates types(turn the config into a type)
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; //eth/usd price address
    }

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    constructor() {
        if (block.chainid == 11155111)
            // sepolia chain id
            activeNetworkConfig = getSepoliaEthConfig(); //blockchain id= current chain
        else if (block.chainid == 1)
            activeNetworkConfig = getMainnetEthConfig();
        else activeNetworkConfig = getOrCreateAnvilEthConfig(); // else means we are in a different chain
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig; // grab a address from a existing live network

        // price feeds address
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfig; // grab a address from a existing live network
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFeed != address(0))
            return activeNetworkConfig; // if we have a price feed we return it // if it's not address 0 then we already set it.
        // if we don't have a price feed we deploy a mock
        // deploy the mocks and return the mocks address(mock contract is like a fake contract)
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_PRICE
        ); // MAGIC NUMBERS(DECIMALS, INITIAL_PRICE) to be replaced with actual values and not look to the script.
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfig;
    }
}
