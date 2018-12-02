var WalletMultiAsset = artifacts.require("./WalletSimpleMultiAsset.sol");
var nullAddress = "";

module.exports = function(deployer) {
  deployer.deploy(WalletMultiAsset, nullAddress);
};
