// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract FundMe {
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getVersion() public pure returns (uint256) {
        return 1;
    }
}
