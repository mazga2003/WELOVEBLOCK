// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

import "../LegoBricks.sol";
import "remix_tests.sol";
import "hardhat/console.sol";

contract LegoBricksTest {
    
    LegoBricks contractToTest;
    address first = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address second = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    function beforeAll() public {
        contractToTest = new LegoBricks(first);
    }
    
    function checkFirstMint() public {
        contractToTest.safeMint(first, "ipfs://someaddress/0");
        Assert.equal(contractToTest.balanceOf(first), uint(1), "The first user should have one NFT minted for him");
    }

    function checkSecondMint() public {
        contractToTest.safeMint(second, "ipfs://someaddress/1");
        Assert.equal(contractToTest.balanceOf(second), uint(1), "The first user should have one NFT minted for him");
    }

    function checkBalances() public {
        uint256 firstBalance = contractToTest.balanceOf(first);
        uint256 secondBalance = contractToTest.balanceOf(second);
        Assert.equal(firstBalance + secondBalance, uint(2), "Balances of the first and the second users should be equal to 1");
    }

    function checkFirstTokenUri() public {
        string memory firstTokenUri = contractToTest.tokenURI(0);
        Assert.equal(firstTokenUri, "ipfs://someaddress/0", "First token's URI is not correct");
    }

    function checkSecondTokenUri() public {
        string memory firstTokenUri = contractToTest.tokenURI(1);
        Assert.equal(firstTokenUri, "ipfs://someaddress/1", "First token's URI is not correct");
    }

}
