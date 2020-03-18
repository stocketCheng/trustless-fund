pragma solidity 0.5.8;

import './TrustlessFund.sol';

contract TrustlessFundFactory {
  mapping(uint => address) funds;
  uint public nextId;

  // Create TrustlessFund
  function createFund(uint expiration, address beneficiary) public {
    require(funds[nextId] == address(0), 'id already in use');
    TrustlessFund fund = new TrustlessFund(expiration, beneficiary, msg.sender);
    funds[nextId] = address(fund);
    nextId++;
  }

  // TODO: Get funds owned by an address

  // Get a fund by id
  function getFund(uint id) public returns(address) {
    return funds[id];
  }
}