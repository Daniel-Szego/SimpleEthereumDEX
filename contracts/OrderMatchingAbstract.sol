pragma solidity ^0.4.23;

contract OrderMatchingAbstract {

    string public version;

    // The order structure
    struct Order{
        uint amount;
        uint price;
        bool buyOrSell;
        string asset;
    }

    // order book    
    Order[] public orderBook;     

    // EVENTS
    event OrderAddedToBook(uint _amount,uint _price, bool _buyOrSell, string _asset);
    event OrderDeletedFromBook(uint _amount,uint _price, bool _buyOrSell, string _asset);
    event OrderMatch(uint _amountBuy,uint _priceBuy, string _assetBuy,
                     uint _amountSell,uint _priceSell, string _assetSell);


    // ORDER BOOK CRUD FUNCTIONS

    // adding order to the order book
    function addOrder(uint _amount,uint _price, bool _buyOrSell, string _asset) public {
        Order memory newOrder = Order(_amount, _price, _buyOrSell, _asset);
        orderBook.push(newOrder);
        emit OrderAddedToBook(_amount,_price,_buyOrSell,_asset);
        // call mathing algorithm on top
        matchOrder();
    }

    // deleting order from the order book - deleting can be called inly internally
    function deleteOrder(uint index) internal{
        uint amount = orderBook[index].amount;
        uint price = orderBook[index].price;
        bool buyOrSell = orderBook[index].buyOrSell;
        string asset = orderBook[index].asset;        
        delete orderBook[index];

        emit OrderDeletedFromBook(amount,price,buyOrSell,asset);
    }

    // getting order details
    function getOrder(uint index) view public returns (uint _amount,uint _price, bool _buyOrSell, string _asset) {
        _amount = orderBook[index].amount;
        _price = orderBook[index].price;
        _buyOrSell = orderBook[index].buyOrSell;
        _asset = orderBook[index].asset;
    }

    // getting only amount
    function getOrderAmount(uint index) view public returns (uint _amount) {
        _amount = orderBook[index].amount;
    }

    // getting only price
    function getOrderPrice(uint index) view public returns (uint _price) {
        _price = orderBook[index].price;
    }

    // getting asset type
    function getOrderAsset(uint index) view public returns (string _asset) {
        _asset = orderBook[index].asset;
    }

    // getting buyOrSell
    function getOrderBuyOrSell(uint index) view public returns (bool _buyOrSell) {
        _buyOrSell = orderBook[index].buyOrSell;
    }

    // returning the size of the order book
    function getOrderBookLenght() view returns (uint){
        return orderBook.length;
    } 

    // start order matching returning effected rows
    function matchOrder() public returns (uint);

    

}
