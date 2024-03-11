// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/./WineOfferFactory.sol";
import "../src/./WineOffer.sol";

contract WineOfferTest is Test {
    //WineOffer wineOffer;
    WineOffer wineOffer;
    event TransferFrom(address indexed from, address indexed to, uint256 tokenId);

    function setUp() public {
        Wine memory wine = Wine({
            owner: msg.sender,
            name: "Test Wine",
            symbol: "TW",
            status: "",
            price: 20,
            discount: 0,
            expectedPriceRange: 0,
            
           // add dynamic ipfs link to contract factory

            maxSupply: 100
        });
        wineOffer = new WineOffer(wine, "Test Wine Offer", "TWO", 100, wine.price);
    }

    
    function testWinePrice() public {
        uint256 price = wineOffer.getPrice();
        assertEq(price, 20);
        emit log("testWinePrice passed");
    }


   function testWineOfferName() public {
        string memory name = wineOffer.name();
        assertEq(name, "Test Wine Offer");
        emit log("testWineOfferName passed");
    }

    function testWineOfferSymbol() public {
        string memory symbol = wineOffer.symbol();
        assertEq(symbol, "TWO");
        emit log("testWineOfferSymbol passed");
    }

   function testMintBottleSubscription() public {
        uint256 tokenId = wineOffer.mintBottleSubscription(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
        assertEq(tokenId, 0);
        emit log("testMintBottleSubscription passed");
    }

    function testMintBottleSubscriptionMultiple() public {
        uint256 tokenId1 = wineOffer.mintBottleSubscription(address(0x1));
        uint256 tokenId2 = wineOffer.mintBottleSubscription(address(0x1));
        assertEq(tokenId1, 0);
        assertEq(tokenId2, 1);
        emit log("testMintBottleSubscriptionMultiple passed");
    }

    function testMintBottleSubscriptionMultipleOwners() public {
        uint256 tokenId1 = wineOffer.mintBottleSubscription(address(0x1));
        uint256 tokenId2 = wineOffer.mintBottleSubscription(address(0x2));
        assertEq(tokenId1, 0);
        assertEq(tokenId2, 1);
        emit log("testMintBottleSubscriptionMultipleOwners passed");
    }

    
    function testFailMintBottleSubscriptionLimitReached() public {
        for (uint i = 0; i < 100; i++) {
            wineOffer.mintBottleSubscription(address(this));
        }
        wineOffer.mintBottleSubscription(address(this));
        emit log("testFailMintBottleSubscriptionLimitReached passed");
    }

   function testTotalSupply() public {
        for (uint i = 0; i < 100; i++) {
            wineOffer.mintBottleSubscription(address(0x1));
        }
        uint256 totalSupply = wineOffer.totalSupply();
        assertEq(totalSupply, 100);
        emit log("testTotalSupply passed");
    }

    
    function testCurrentDemand() public {
        uint256 res = wineOffer.checkCurrentDemand(20, 5);
        assertEq(res, 4);
        emit log("testCurrentDemand passed");
    }
}