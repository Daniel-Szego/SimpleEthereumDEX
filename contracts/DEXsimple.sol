pragma solidity ^0.4.23;
import "./DEXAbstract.sol";
import "./WalletAbstract.sol";
import "./WalletSimpleMultiAsset.sol";

contract DEXSimple is DEXAbstract {

    string public version = "DEX.Simple.0.0.1";

    // first version - with central administrator
    address public administrator;

    address public walletAddress;

    // default constructor - is it needed ?
    constructor(){
        administrator = msg.sender;
    }  

    // modifiers
    modifier isAdmin(){
        require(administrator == msg.sender);
        _;
    }

    // setting wallet address
    function setWalletAddress(address _address) isAdmin() {
        walletAddress = _address;
    }

    // mint token
    function mint (address _address, uint _value, string _asset)  isAdmin() public {
        WalletSimpleMultiAsset wallet = WalletSimpleMultiAsset(walletAddress);
        wallet.mintAsset(_address, _value, _asset);        
    }



}
