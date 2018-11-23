pragma solidity ^0.4.23;
import "./OrderMatchingAbstract.sol";

contract OrderMatchingSimple is OrderMatchingAbstract {

   string public version = "OM.Simple.0.0.1";

   //Constructor
   constructor(){

   }

    // start order matching returning effected rows
    function matchOrder() internal returns (uint) {
        return 0;
    }

}
