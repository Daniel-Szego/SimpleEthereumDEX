var WalletMultiAsset = artifacts.require("./WalletSimpleMultiAsset.sol");
var DEXSimple = artifacts.require("./DEXSimple.sol");
var nullAddress = "";

module.exports = function(deployer) {
  deployer.deploy(DEXSimple).then(function() {
    return deployer.deploy(WalletMultiAsset, DEXSimple.address);
  });

};
