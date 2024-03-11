// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.13;

import {ERC721} from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

struct Wine {
    address owner;
    string name;
    string symbol;
    string status;
    uint256 price;
    uint256 discount;
    uint256 expectedPriceRange;
    
    // What should be on chain?

    /* uint256 lastYearSugarLevel;
    uint256 lastYearAlcoholLevel;
    uint256 lastYearAcidityLevel;
    uint256 lastYearBodyLevel;
    uint256 lastYearTanninLevel;
    uint256 lastYearColor;
    uint256 lastYearAroma;
    uint256 lastYearTaste;
    uint256 lastYearFinish;
    */
    uint256 maxSupply;
}


contract WineOffer is ERC721Enumerable {
    uint256 private _nextTokenId;
    uint256 private _maxSupply;
    Wine public wine;

   constructor(Wine memory, string memory name, string memory symbol, uint256 maxSupply, uint256 _price ) ERC721(name, symbol) {
        _maxSupply = maxSupply;
        wine.price = _price;
    }

    
    // Change name, change ...
    // Change Status

    // function to get the owner of the wineOffer from the Wine struct
    function getOwner() public view returns (address) {
        return wine.owner;
    }

    function getPrice() public view returns (uint256) {
        return wine.price;
    }

    // mint function
    function mintBottleSubscription(address _to) public returns (uint256){
        require(totalSupply() < _maxSupply, "Subscription limit reached");
        uint256 tokenId = _nextTokenId++;
        _safeMint(_to, tokenId);
        return tokenId;
    }
}