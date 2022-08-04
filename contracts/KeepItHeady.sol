// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./Single.sol";
import "./ZoraV3/ZoraAsks.sol";

contract KeepItHeady is ERC721Enumerable, Single, ZoraAsks {
    constructor(
        string memory name_,
        string memory symbol_,
        address _sellerFundsRecipient,
        address _zoraAsksV1_1,
        address _zoraTransferHelper,
        address _zoraModuleManager
    )
        ERC721(name_, symbol_)
        ZoraAsks(
            _zoraAsksV1_1,
            _zoraTransferHelper,
            _zoraModuleManager,
            _sellerFundsRecipient
        )
    {
        // Music Metadata Setup
        setupSongMetadata();
        setupProjectMetadata();
        setupCollaborators();
        setupTags();

        // Token Minting
        _mint(address(this), 1);
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

    function isApprovedForAll(address _owner, address _operator)
        public
        view
        virtual
        override(ERC721, IERC721)
        returns (bool)
    {
        if (_owner == address(this) && (_operator == zoraTransferHelper))
            return true;
        else {
            return super.isApprovedForAll(_owner, _operator);
        }
    }
}
