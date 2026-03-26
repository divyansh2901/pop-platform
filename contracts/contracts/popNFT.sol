// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PopNFT is ERC721, Ownable {
    uint256 public tokenCounter;

    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("ProofOfParticipation", "POP") {
        tokenCounter = 0;
        _transferOwnership(msg.sender); // ✅ set owner explicitly
    }

    function mintNFT(address user, string memory metadataURI) public onlyOwner {
        uint256 tokenId = tokenCounter;

        _safeMint(user, tokenId);
        _tokenURIs[tokenId] = metadataURI;

        tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return _tokenURIs[tokenId];
    }
}