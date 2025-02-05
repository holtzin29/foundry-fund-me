# FundMe Project and SimpleStorage/StorageFactory Projects

## Description
FundMe is a smart contract-based decentralized crowdfunding platform. It allows users to fund the contract with Ether and supports withdrawal functionality for the owner. The project demonstrates Solidity programming, smart contract development, and testing using Foundry.

## Features
- Users can fund the contract with Ether.
- Tracks the funding amount for each user.
- Only the contract owner can withdraw funds.
- Includes comprehensive test coverage for various scenarios.

## Technologies Used
- **Solidity**: Smart contract programming language.
- **Foundry**: A powerful development environment for Ethereum.
- **Forge**: Used for writing and running tests.

## Deployment
The contract is deployed using a script called `DeployFundMe` in the project. 

## Testing
The project includes automated tests written using Foundry. Test cases ensure the following:
- Only the owner can withdraw funds.
- Users cannot withdraw funds.
- Proper updates to the data structure for funders.
- Contract can handle multiple funders.

- ## It also contains an SimpleStorage and Storage Factory outside ofthe foundry-fund-me.
- What the Simple Storage does is simply store an list of favorite number by various and a way we can add more people and their favorite numbers.
- The StorageFactory is a simple contract in which people can fund into the contract and also a function to get the version and it simply returns the number of the version.

  ## Deployment:
  SimpleStorage also has an simple Deploy script in which just has an function run to run the script 

## Libraries:
-This repository uses three libraries:
- Foundry-DevOps from Cyfrin
- Chainlink-brownie-contracts from Chainlink
- Forge-std from Foundry

## Inspiration:

This repo and projects are inspired in the Solidity 101 course from Cyfrin.

## License:
MIT License.
