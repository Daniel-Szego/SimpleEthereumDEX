var OrderMatchingPartial = artifacts.require("./OrderMatchingPartial.sol");

module.exports = function(deployer) {
  deployer.deploy(OrderMatchingPartial);
};
