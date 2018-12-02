pragma solidity ^0.4.23;
import "./OrderMatchingAbstract.sol";
import "./WalletAbstract.sol";

contract DEXAbstract {

    string public version = "DEX.0.0.1";

    OrderMatchingAbstract public orderMatching;
    WalletAbstract public wallet;

    constructor(OrderMatchingAbstract _orderMatching, WalletAbstract _wallet){
        orderMatching = _orderMatching;
        wallet = _wallet;
    }


}
