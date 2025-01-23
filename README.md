# FundMe Project

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
