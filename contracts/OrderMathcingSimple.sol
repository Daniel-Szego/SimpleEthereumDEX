pragma solidity ^0.4.23;
import "./OrderMatchingAbstract.sol";

// matching exaxt orders
contract OrderMatchingSimple is OrderMatchingAbstract {

   string public version = "OM.Simple.0.0.1";

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
                        // matching amount
	                  	if (orderBook[actualBuyOrderIndex].amount == orderBook[actualSellOrderIndex].amount) {
                        {
                            //matching price
                            if (orderBook[actualBuyOrderIndex].price >= orderBook[actualSellOrderIndex].price) {
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
                        }                      	
                    }                  	
                }      		
            }
        }
    }
}
}
}

