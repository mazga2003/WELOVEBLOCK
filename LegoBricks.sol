// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts@4.9.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.9.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.3/token/ERC721/extensions/ERC721URIStorage.sol";

import "hardhat/console.sol";

contract LegoBricks is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner) ERC721("LegoBricks", "bryk") {
        console.log("initial owner:", initialOwner);
    }

    function safeMint(address to, string calldata uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        console.log("id of a newly minted token:", tokenId);
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
}