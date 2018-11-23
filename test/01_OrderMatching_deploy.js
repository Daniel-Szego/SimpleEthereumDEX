var OM = artifacts.require("OrderMatchingSimple");
var OMInstance;
var version;

contract('Order Matching', function(accounts) {
    it("test of the Order Matching contract: deployed", function() {
        return OM.deployed().then(function(instance) {
            OMInstance = instance;
            return OMInstance.version({from: accounts[0]});             
        }).then(function(result) {
            version = result;
            assert.equal(version, "OM.Simple.0.0.1", "version matching");      
        });
    });
});