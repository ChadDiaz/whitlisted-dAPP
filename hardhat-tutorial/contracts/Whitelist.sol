pragma solidity ^0.8.0;

contract Whitlest {

  //max number of whitliested addresses allowed
  uint8 public maxWhitlistedAddresses;

  //Creat a mapping of whitlistedAddresses
  // if an address is whitlisted, we set it to true. it is false by default for all other addresses
  mapping(address=> bool) public whitelistedAddresses;

  //numAddressesWhitlisted would be used to keep track of how many addresses have been whitelisted
  uint8 public numAddressesWhitlisted;

  // setting the max number of whitlisted addresses. User will put the value at time of deployment
  constructor(uint8 _maxWhitelistedAddresses){
    maxWhitlistedAddresses = _maxWhitelistedAddresses;
  }
  // addAddressToWhitelist - this function adds the address to the whitelist
  function addAddressToWhitelist() public {
    // see if user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitlisted");
    //check if the numAddressesWhitlisted has been exceeded compared to maxWhitlistedAddresses and if so, throw an error
    require(numAddressesWhitlisted < maxWhitlistedAddresses, "No additional addresses can be added at this time as the limit has been reached");
    //add the addresses which called the function to the whitlisted array
    whitelistedAddresses[mes.sender] = true;
    //then we need to increase the number of whitlisted addressess 
    numAddressesWhitlisted += 1;
  }
}