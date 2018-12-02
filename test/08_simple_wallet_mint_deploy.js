var Wallet = artifacts.require("WalletSimpleMultiAsset");
var WalletInstance;
var version;
var balance1;
var balance2;

contract('Wallet', function(accounts) {
    it("simple wallet: mint, transfer", function() {
        return Wallet.deployed().then(function(instance) {
            WalletInstance = instance;
            return WalletInstance.version({from: accounts[0]});             
        }).then(function(result) {
            version = result;
            return WalletInstance.mintAsset(accounts[0], 100, "ETH", {from: accounts[0]});             
        }).then(function(result) {
            return WalletInstance.transferAsset(accounts[1], 50, {from: accounts[0]});             
        }).then(function(result) {
            return WalletInstance.getBalance(accounts[0],{from: accounts[0]});             
        }).then(function(result) {
            balance1 = result;
            return WalletInstance.getBalance(accounts[1],{from: accounts[0]});             
        }).then(function(result) {           
            balance2 = result;

            assert.equal(version, "Wallet.0.0.1", "version matching");      
            assert.equal(balance1, 50, "balance 1 match");      
            assert.equal(balance2, 50, "balance 2 match");      
            
        });
    });
});