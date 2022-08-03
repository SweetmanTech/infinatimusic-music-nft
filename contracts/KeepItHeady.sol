// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./Single.sol";

contract KeepItHeady is ERC721Enumerable, Single {
    constructor(
        string memory name_,
        string memory symbol_,
        address _originalHolder
    ) ERC721(name_, symbol_) {
        setupSongMetadata();
        setupProjectMetadata();
        setupCollaborators();
        setupTags();
        _mint(_originalHolder, 1);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override(ERC721)
        returns (string memory)
    {
        require(_exists(_tokenId), "tokenId doesn't exist");
        return musicTokenUri(_tokenId);
    }
}
