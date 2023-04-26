const MusicianManager = artifacts.require('MusicianManager');

module.exports = function(_deployer) {
  _deployer.deploy(MusicianManager);
};
