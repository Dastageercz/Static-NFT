//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//https://ipfs.io/ipfs/Qma2VxzFL6AT5CXCK4r4pDVH7sn9sY3u11E2r7ibrgcQUu

contract NFT is ERC721,ERC721Burnable, Ownable  {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    string public baseTokenURI;

    constructor() ERC721("Albert-Einstein", "ALE") {
        baseTokenURI ="";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _baseURI() internal view override returns(string memory) {
        return baseTokenURI;
    }

    function setbaseTokenURI(string memory _uri) public {
        baseTokenURI = _uri;
    } 
}

