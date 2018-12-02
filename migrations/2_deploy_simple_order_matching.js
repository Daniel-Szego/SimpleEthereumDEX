var OrderMatchingSimple = artifacts.require("./OrderMatchingSimple.sol");

module.exports = function(deployer) {
  deployer.deploy(OrderMatchingSimple);
};
