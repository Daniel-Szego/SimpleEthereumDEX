var Wallet = artifacts.require("WalletSimpleMultiAsset");
var DEX = artifacts.require("DEXSimple");
var DEXInstance;
var WalletInstance;
var versionWallet;
var versionDEX;
var balance1;
var balance2;

contract('Wallet and DEX', function(accounts) {
    it("simple wallet with DEX: mint, transfer", function() {
        return DEX.deployed().then(function(instance) {
            DEXInstance = instance;
            return DEXInstance.version({from: accounts[0]});             
        }).then(function(result) {  
            versionDEX = result;
            return Wallet.deployed(DEXInstance);
        }).then(function(result) {          
            WalletInstance = result;
            return WalletInstance.version({from: accounts[0]});             
        }).then(function(result) {        
            versionWallet = result;            
            return DEXInstance.setWalletAddress(WalletInstance.address, {from: accounts[0]});             
        }).then(function(result) {         
            return DEXInstance.mint(accounts[0], 100, "ETH", {from: accounts[0]});             
        }).then(function(result) {       
            return WalletInstance.transferAsset(accounts[1], 50, {from: accounts[0]});             
        }).then(function(result) {      
            return WalletInstance.getBalance(accounts[0],{from: accounts[0]});             
        }).then(function(result) {
            balance1 = result;
            return WalletInstance.getBalance(accounts[1],{from: accounts[0]});             
        }).then(function(result) {           
            balance2 = result;

            assert.equal(versionWallet, "Wallet.0.0.1", "version matching");  
            assert.equal(versionDEX, "DEX.Simple.0.0.1", "version matching");              
            assert.equal(balance1, 50, "balance 1 match");      
            assert.equal(balance2, 50, "balance 2 match");      
            
        });
    });
});