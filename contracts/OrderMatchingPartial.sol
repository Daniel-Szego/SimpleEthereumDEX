pragma solidity ^0.4.23;
import "./OrderMatchingAbstract.sol";

// matching exaxt orders
contract OrderMatchingPartial is OrderMatchingAbstract {

   string public version = "OM.Partial.0.0.1";

   //Constructor
   constructor(){

   }

    // start order matching returning effected rows
    function matchOrder() public returns (uint) {

        for(uint actualBuyOrderIndex=0; actualBuyOrderIndex < orderBook.length; actualBuyOrderIndex++) {
      	if (orderBook[actualBuyOrderIndex].buyOrSell == true) {
		  	for(uint actualSellOrderIndex=0; actualSellOrderIndex < orderBook.length; actualSellOrderIndex++) {
				if (orderBook[actualSellOrderIndex].buyOrSell == false) {
                	// matching asset type 
                  	if (sha256(orderBook[actualBuyOrderIndex].asset) == sha256(orderBook[actualSellOrderIndex].asset)) {       

                        //matching price
                        if (orderBook[actualBuyOrderIndex].price >= orderBook[actualSellOrderIndex].price) {

                            // partial matching: case - exact amount
                            if (orderBook[actualBuyOrderIndex].amount == orderBook[actualSellOrderIndex].amount) {
                                //MATCHING
                                // Event
                                emit OrderMatch(orderBook[actualBuyOrderIndex].amount,
                                orderBook[actualBuyOrderIndex].price,
                                orderBook[actualBuyOrderIndex].asset,
                                orderBook[actualSellOrderIndex].amount,
                                orderBook[actualSellOrderIndex].price,
                                orderBook[actualSellOrderIndex].asset);

                                // Applying to state

                                // Deleting the orders
                                deleteOrder(actualBuyOrderIndex);
                                deleteOrder(actualSellOrderIndex);
                            }
                            // partial matching: case - more buy than sell
                            else if (orderBook[actualBuyOrderIndex].amount > orderBook[actualSellOrderIndex].amount) {
                                uint amountBuy = orderBook[actualBuyOrderIndex].amount - orderBook[actualSellOrderIndex].amount;

                                //MATCHING
                                // Event
                                emit OrderMatch(amountBuy,
                                orderBook[actualBuyOrderIndex].price,
                                orderBook[actualBuyOrderIndex].asset,
                                amountBuy,
                                orderBook[actualSellOrderIndex].price,
                                orderBook[actualSellOrderIndex].asset);

                                // Applying to state

                                // Deleting the orders
                                deleteOrder(actualSellOrderIndex);
                                orderBook[actualBuyOrderIndex].amount = orderBook[actualBuyOrderIndex].amount - amountBuy;                       
                            }               
                            // partial matching: case - more sell  than buy
                            else if (orderBook[actualBuyOrderIndex].amount < orderBook[actualSellOrderIndex].amount) {
                            uint amountSell = orderBook[actualSellOrderIndex].amount - orderBook[actualBuyOrderIndex].amount;
                       
                                //MATCHING
                                // Event
                                emit OrderMatch(amountSell,
                                orderBook[actualBuyOrderIndex].price,
                                orderBook[actualBuyOrderIndex].asset,
                                amountSell,
                                orderBook[actualSellOrderIndex].price,
                                orderBook[actualSellOrderIndex].asset);

                                // Applying to state

                                // Deleting the orders
                                deleteOrder(actualBuyOrderIndex);
                                orderBook[actualSellOrderIndex].amount = orderBook[actualSellOrderIndex].amount - amountSell; 
                            }                      	       	
                        }                  	
                    }      		
                }
            }
        }
    }
}
}