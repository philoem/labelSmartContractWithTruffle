// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SecurityManager {
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, 'Not the Owner');
    _;
  }
}
