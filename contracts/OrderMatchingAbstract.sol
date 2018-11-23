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

    // ORDER BOOK CRUD FUNCTIONS

    // adding order to the order book
    function addOrder(uint _amount,uint _price, bool _buyOrSell, string _asset) public {
        Order memory newOrder = Order(_amount, _price, _buyOrSell, _asset);
        orderBook.push(newOrder);
    }

    // deleting order from the order book - deleting can be called inly internally
    function deleteOrder(uint index) internal{
        delete orderBook[index];
    }

    // getting order details
    function getOrder(uint index) view public returns (uint _amount,uint _price, bool _buyOrSell, string _asset) {
        _amount = orderBook[index].amount;
        _price = orderBook[index].price;
        _buyOrSell = orderBook[index].buyOrSell;
        _asset = orderBook[index].asset;
    }

    // returning the size of the order book
    function getOrderBookLenght() view returns (uint){
        return orderBook.length;
    } 

    // start order matching returning effected rows
    function matchOrder() internal returns (uint);

    

}
