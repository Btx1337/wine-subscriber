// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.13;

import {ERC721} from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Math} from '@openzeppelin/contracts/utils/math/Math.sol';

struct Wine {
    address owner;
    string name;
    string symbol;
    string status;
    uint256 price;
    uint256 discount;
    uint256 expectedPriceRange;
    uint256 maxSupply;
}


contract WineOffer is ERC721Enumerable {
    using Math for uint256;

    uint256 private _nextTokenId;
    uint256 private _maxSupply;
    Wine public wine;
    bytes32 wineDescription;

   constructor(Wine memory, string memory name, string memory symbol, uint256 maxSupply, uint256 _price ) ERC721(name, symbol) {
        _maxSupply = maxSupply;
        wine.price = _price;
        wineDescription = keccak256("https://rose-compulsory-whippet-602.mypinata.cloud/ipfs/QmXGA9SrTyvbMutcwBPFhCQm1aPX8Ty1WeSfnV9tzqkmHm");
    }

    
    // Change name, change ...
    // Change Status

    function checkCurrentDemand(uint256 _a, uint256 _b) public pure returns (uint256) {
        // Check current demand = calculation of mints vs time window?
        uint256 demand  = _a / _b;
        return demand;
    }

    function calcPrice() public view returns (uint256) {
        // calculateCurrentPrice 
    }

    // function to get the owner of the wineOffer from the Wine struct
    function getOwner() public view returns (address) {
        return wine.owner;
    }

    function getPrice() public view returns (uint256) {
        return wine.price;
    }

    function getWineDescription() public view returns (bytes32) {
        return wineDescription;
    }

    // mint function
    function mintBottleSubscription(address _to) public returns (uint256){
        require(totalSupply() < _maxSupply, "Subscription limit reached");
        uint256 tokenId = _nextTokenId++;
        _safeMint(_to, tokenId);
        return tokenId;
    }
}