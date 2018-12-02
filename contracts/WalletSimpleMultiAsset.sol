pragma solidity ^0.4.23;
import "./WalletAbstract.sol";

// simple multiasset wallet, one address, one asset type
contract WalletSimpleMultiAsset {

    string public version = "Wallet.0.0.1";

    // Simple balance structure
    struct Balance{
        uint amount;
        string asset;
    }

    // multi asset balances
    mapping(address => Balance) public balances;

    // MODIFIERS
    modifier isAddressOwner (address _address){
        require(msg.sender == _address);
        _;
    }

    // READ FUNCTIONS
    // function get balance
    function getBalance(address _address) view public returns (uint){
        return balances[_address].amount; 
    }

    // function get asset
    function getAsset(address _address) view public returns (string){
        return balances[_address].asset; 
    }

    // ACTIVE FUNCTIONS
    // mint asset - in this implementation only for demo
    function mintAsset(address _address, uint _amount, string asset) isAddressOwner(_address) public returns (string){
        balances[_address].amount =  balances[_address].amount + _amount;
        balances[_address].asset =  balances[_address].asset;
    }

    // transfer asset - do not use live, underflow and overflow attack
    function transferAsset(address _address, uint _amount) isAddressOwner(_address) public returns (string){
        require(sha256(balances[_address].asset) == sha256(balances[msg.sender].asset));
        balances[_address].amount =  balances[_address].amount + _amount;
        balances[msg.sender].amount =  balances[msg.sender].amount - _amount;
    }



}