var OrderMatching = artifacts.require("./OrderMatchingSimple.sol");

module.exports = function(deployer) {
  deployer.deploy(OrderMatching);
};
