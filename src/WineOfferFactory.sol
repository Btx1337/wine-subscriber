// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./WineOffer.sol";


contract WineOfferFactory{
    
    event WineOfferCreated(address indexed wineOfferAddress, string name, string symbol, uint256 maxSupply);

    WineOffer[] public wineOffers;

    function CreateWineOffer(string memory _name, string memory _symbol, uint256 _maxSupply, uint256 _price) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        
       Wine memory wine = Wine({
            owner: msg.sender,
            name: _name,
            symbol: _symbol,
            status: "",
            price: _price,
            discount: 0,
            expectedPriceRange: 0,
            
            /*lastYearSugarLevel: 0,
            lastYearAlcoholLevel: 0,
            lastYearAcidityLevel: 0,
            lastYearBodyLevel: 0,
            lastYearTanninLevel: 0,
            lastYearColor: 0,
            lastYearAroma: 0,
            lastYearTaste: 0,
            lastYearFinish: 0,
            */
            maxSupply: _maxSupply
        });
        // price
        // Access the struct from WineOffer.sol and set the price to 1000


   

        // % discount
        // expected price range        

        // expected harvest date
        // expected sugar level
        // expected alcohol level
        // expected acidity level
        // expected body level
        // expected tannin level
        // expected color
        // expected aroma
        // expected taste
        // expected finish
  
        // last year sugar level
        // last year alcohol level
        // last year acidity level
        // last year body level
        // last year tannin level
        // last year color
        // last year aroma
        // last year taste
        // last year finish

// Add control functions
// Change name, change ...
// delete wine offer?
// change owner?

// Maybe we can add this from external sources
        // expected temperature
        // expected rain
        // expected sun
        // expected wind
        // expected hail
        // expected frost
        // expected snow
        // expected drought

        // last harvest date
        // last bottling date
        // last year temperature
        // last year rain
        // last year sun
        // last year wind
        // last year hail
        // last year frost
        // last year snow
        // last year drought
        
        WineOffer newWineOffer = new WineOffer(wine, _name, _symbol, _maxSupply, _price);
        wineOffers.push(newWineOffer);
        emit WineOfferCreated(address(newWineOffer), _name, _symbol, _maxSupply);
    }

    function GetWineOfferCount() public view returns (uint) {
        return wineOffers.length;
    }
}