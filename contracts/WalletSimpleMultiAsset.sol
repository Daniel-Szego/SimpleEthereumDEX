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

    // DEX reference
    address public DEX;

    // Constructor
    constructor (address _DEX){
        DEX = _DEX;
    }

    // MODIFIERS
    modifier isAddressOwner (address _address){
        require(msg.sender == _address);
        _;
    }

    modifier isCallerDEX (){
        require(msg.sender == DEX);
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

    // DIRECT USER FUNCTIONS
    // mint asset - only DEX can mint assets
    function mintAsset(address _address, uint _amount, string _asset) isCallerDEX() public{
        balances[_address].amount =  balances[_address].amount + _amount;
        balances[_address].asset =  _asset;
    }

    // transfer asset - do not use live, underflow and overflow attack
    function transferAsset(address _address, uint _amount)  public {
        if (bytes(balances[_address].asset).length > 0){
            require(sha256(balances[_address].asset) == sha256(balances[msg.sender].asset));
        }
        require (balances[msg.sender].amount > _amount);
        balances[_address].amount =  balances[_address].amount + _amount;
        balances[msg.sender].amount =  balances[msg.sender].amount - _amount;
    }

    // transfer asset - do not use live, underflow and overflow attack
    function transferAssetFrom(address _from, address _to, uint _amount) isCallerDEX() public returns (string){
        if (bytes(balances[_to].asset).length > 0){
            require(sha256(balances[_from].asset) == sha256(balances[_to].asset));
        }
        require (balances[_from].amount > _amount);
        balances[_to].amount =  balances[_to].amount + _amount;
        balances[_from].amount =  balances[_from].amount - _amount;
    }
}

