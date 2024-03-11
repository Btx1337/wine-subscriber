// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/./WineOfferFactory.sol";
import "../src/./WineOffer.sol";

contract WineOfferFactoryTest is Test {
 WineOfferFactory factory;

 function setUp() public {
   factory = new WineOfferFactory();
 }

 function testCreatedWineOffer() public {
   string memory name = "Test Wine Offer";
   string memory symbol = "TWO";
   uint maxSupply = 100;
   uint _price = 20000;
   factory.CreateWineOffer(name, symbol, maxSupply, _price);
   WineOffer createdWineOffer = factory.wineOffers(0);
   assertNotEq(address(createdWineOffer), address(0));
   emit log("testCreatedWineOffer passed");
 }

 function testFailCreateWineOfferWithEmptyName() public {
   factory.CreateWineOffer("", "TWO", 100, 200);
   emit log("testFailCreateWineOfferWithEmptyName passed");
 }

 function testGetWineOfferCount() public {
   string memory name = "Test Wine Offer";
   string memory symbol = "TWO";
   uint maxSupply = 100;
   uint256 _price = 20000;
   factory.CreateWineOffer(name, symbol, maxSupply, _price);
   uint count = factory.GetWineOfferCount();
   assertEq(count, 1);
   emit log("testGetWineOfferCount passed");
 }


}