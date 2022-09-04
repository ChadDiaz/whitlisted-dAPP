const { ethers } = require("hardhat");

async function main() {
  /* A Contract Factory in ethers.js is an abstraction used to deploy new smart contracts, so whitelistContract here is a factory for instances of our Whitelist Contract */
  const whitelistContract = await getContractFactory("Whitelist");

  // here we deploy the contract
  const deployedWhitelistContract = whitelistContract.deploy(10);
  // we are setting the max allowed whitelisted addresses to 10 above

  //wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // print the address of the whitelisted contract
  console.log("Whitelist Contract Address", deployedWhitelistContract.address);
}