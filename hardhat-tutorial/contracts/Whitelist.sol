pragma solidity ^0.8.0;

contract Whitelist {

  //max number of whitliested addresses allowed
  uint8 public maxWhitelistedAddresses;

  //Creat a mapping of whitelistedAddresses
  // if an address is whitleisted, we set it to true. it is false by default for all other addresses
  mapping(address=> bool) public whitelistedAddresses;

  //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
  uint8 public numAddressesWhitelisted;

  // setting the max number of Whitelisted addresses. User will put the value at time of deployment
  constructor(uint8 _maxWhitelistedAddresses){
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }
  // addAddressToWhitelist - this function adds the address to the whitelist
  function addAddressToWhitelist() public {
    // see if user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been Whitelisted");
    //check if the numAddressesWhitelisted has been exceeded compared to maxWhitelistedAddresses and if so, throw an error
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "No additional addresses can be added at this time as the limit has been reached");
    //add the addresses which called the function to the Whitelisted array
    whitelistedAddresses[msg.sender] = true;
    //then we need to increase the number of Whitelisted addressess 
    numAddressesWhitelisted += 1;
  }
}