pragma solidity ^0.4.23;
import "./OrderMatchingAbstract.sol";
import "./WalletAbstract.sol";

contract DEXAbstract {

    string public version = "DEX.0.0.1";

    OrderMatchingAbstract public orderMatching;
    WalletAbstract public wallet;

    // default constructor - is it needed ?
    constructor(){

    }

    // registering references
    function RegisterReferences (OrderMatchingAbstract _orderMatching, WalletAbstract _wallet) public {
        orderMatching = _orderMatching;
        wallet = _wallet;
    }


}
