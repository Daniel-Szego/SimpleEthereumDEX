var Wallet = artifacts.require("WalletSimpleMultiAsset");
var WalletInstance;
var version;

contract('Wallet', function(accounts) {
    it("simple wallet: deployed", function() {
        return Wallet.deployed().then(function(instance) {
            WalletInstance = instance;
            return WalletInstance.version({from: accounts[0]});             
        }).then(function(result) {
            version = result;
            assert.equal(version, "Wallet.0.0.1", "version matching");      
        });
    });
});