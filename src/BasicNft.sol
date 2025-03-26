// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

   constructor() ERC721("Doggie", "DOG"){
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public returns (uint256) {
        uint256 newTokenId = s_tokenCounter;
        s_tokenIdToUri[newTokenId] = tokenUri;
        _safeMint(msg.sender, newTokenId);
        s_tokenCounter++;
        return newTokenId;
    }

      function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
