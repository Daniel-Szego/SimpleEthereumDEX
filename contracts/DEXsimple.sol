pragma solidity ^0.4.23;
import "./DEXAbstract.sol";
import "./WalletSimpleMultiAsset.sol";

contract DEXSimple is DEXAbstract {

    string public version = "DEX.Simple.0.0.1";

    // first version - with central administrator
    address administrator;

    WalletAbstract wallet;

    // default constructor - is it needed ?
    constructor(){
        administrator = msg.sender;
    }

    // modifiers
    modifier isAdmin(){
        require(administrator == msg.sender);
        _;
    }

    // mint token
    function mint (address _address, uint _value, string _asset) isAdmin() public {
        wallet.mintAsset(_address, _value, _asset);        
    }



}
