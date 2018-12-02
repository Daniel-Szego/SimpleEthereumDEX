var WalletMultiAsset = artifacts.require("./WalletSimpleMultiAsset.sol");

module.exports = function(deployer) {
  deployer.deploy(WalletMultiAsset);
};
