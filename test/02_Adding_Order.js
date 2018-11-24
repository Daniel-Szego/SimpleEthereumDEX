var OM = artifacts.require("OrderMatchingSimple");
var OMInstance;
var version;
var orderBookLength;

contract('Order Matching', function(accounts) {
    it("test of the Order Matching contract: adding order", function() {
        return OM.deployed().then(function(instance) {
            OMInstance = instance;
            return OMInstance.version({from: accounts[0]});             
        }).then(function(result) {
            version = result;
            return OMInstance.version({from: accounts[0]});             
        }).then(function(result) {
            return OMInstance.addOrder(100,100,true,"ETH",{from: accounts[0]});             
        }).then(function(result) {
            return OMInstance.getOrderBookLenght({from: accounts[0]});             
        }).then(function(result) {
            orderBookLength = result;
            assert.equal(version, "OM.Simple.0.0.1", "version matching");      
            assert.equal(orderBookLength, 1, "order book length");                              
        });
    });
});
