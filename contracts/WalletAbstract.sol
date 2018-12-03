pragma solidity ^0.4.23;

contract WalletAbstract {

    string public version = "Wallet.0.0.1";

    function getBalance(address _address) view public returns (uint);

    function getAsset(address _address) view public returns (string);

    function mintAsset(address _address, uint _amount, string asset) public returns (string);

    function transferAsset(address _address, uint _amount) public returns (string);

    function transferAssetFrom(address _from, address _to, uint _amount) public returns (string);

}
