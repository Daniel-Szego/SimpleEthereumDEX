# Experimental implementation of an Ethereum decentralized exchange

Objects and object hierarchies

DEX  - Decentalized Exchange
 - covering all the top level functionalities
 - DEXAbstract - abstract ancestor class

Wallet - wallet functionalities
 - handling multiasset balances and realizing transfer functionalities
 - WalletAbstract - abstract base class

 OrderMatching - imlementatin of different order matching algorithms
 - OrderMatchingAbstract - abstract class for order matching functionalities
 - OrderMatchingSimple - matching orders only with the same amount
 - OrderMatchingPartial - matching orders with different amounts
 
  
