// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import './SecurityManager.sol';

contract MusicianManager is SecurityManager {
  SecurityManager public securityManager;

  constructor() {
    securityManager = new SecurityManager();
  }

  event musicianCreated(string _artistName);
  event trackAdded(string _artistName, string _title);
  event getTheTracks(Track[] _tracks);

  struct Track {
    string _title;
    uint _duration;
  }

  struct Musician {
    string _artistName;
    Track[] _tracks;
  }

  mapping(address => Musician) Musicians;

  function addMusician(
    address _musicianAddress,
    string memory _artistName
  ) external onlyOwner {
    require(
      bytes(Musicians[_musicianAddress]._artistName).length == 0,
      'This musician has been already created'
    );
    Musicians[_musicianAddress]._artistName = _artistName;
    emit musicianCreated(_artistName);
  }

  function addTrack(
    address _musicianAddress,
    string memory _title,
    uint _duration
  ) external onlyOwner {
    require(
      bytes(Musicians[_musicianAddress]._artistName).length > 0,
      'This track has been already created'
    );
    Track memory thisTrack = Track(_title, _duration);
    Musicians[_musicianAddress]._tracks.push(thisTrack);
    emit trackAdded(Musicians[_musicianAddress]._artistName, _title);
  }

  function getTracks(address _musicianAddress) external {
    emit getTheTracks(Musicians[_musicianAddress]._tracks);
  }
}
