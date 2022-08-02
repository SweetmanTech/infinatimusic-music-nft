// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "./KeepItHeady.sol";

contract Album is ERC721Upgradeable, KeepItHeady {
    // The tokenId of the token to be minted.
    uint256 private tokenId;

    function initialize(
        string memory name_,
        string memory symbol_,
        address _originalHolder
    ) public initializer {
        __ERC721_init(name_, symbol_);
        setupSongMetadata();
        setupProjectMetadata();
        setupCollaborators();
        setupTags();
        mint(_originalHolder);
    }

    function mint(address _to) internal returns (uint256) {
        tokenId += 1;
        _mint(_to, tokenId);
        return tokenId;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override(ERC721Upgradeable)
        returns (string memory)
    {
        require(_exists(_tokenId), "tokenId doesn't exist");
        return musicTokenUri(_tokenId);
    }
}
