// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./ZoraV3/ZoraAsks.sol";

contract Single is ERC721Enumerable, ZoraAsks {
    // count of minted tokens
    uint256 public tokenId;
    // mapping of tokenId to hasBeenTransferred
    mapping(uint256 => bool) tokenTransferred;

    constructor(
        address _sellerFundsRecipient,
        address _zoraAsksV1_1,
        address _zoraTransferHelper,
        address _zoraModuleManager
    )
        ERC721("Keep it Heady", "INF")
        ZoraAsks(
            _zoraAsksV1_1,
            _zoraTransferHelper,
            _zoraModuleManager,
            _sellerFundsRecipient
        )
    {}

    /// @notice mints 1 edition locked in this contract.
    function mint() internal {
        // Token Minting
        tokenId++;
        _mint(address(this), tokenId);
    }

    /// @notice Returns music metadata for the single
    /// @param _tokenId the tokenId with music metadata
    /// @return musicMetadata follows Catalog standard here: https://gist.github.com/bretth18/df8358c840fa94946ec212f753e290dd
    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override(ERC721)
        returns (string memory)
    {
        require(_exists(_tokenId), "tokenId doesn't exist");
        return
            "ipfs://bafkreiajivasnm6iipnhy454m273gs57r3k6es7uk5nskth4x6qbvsfeam";
    }

    /// @notice See {IERC721-isApprovedForAll}.
    /// @dev manual approval for Zora Transfer Helper.
    /// @param _owner of music nft
    /// @param _operator operator to approve for
    /// @return isApprovedForAll
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

    /// @notice Hook that is called after any transfer of tokens
    /// @dev This includes minting and burning.
    /// @dev manual approval for Zora Transfer Helper.
    /// @param _from sender
    /// @param _to recipient
    function _afterTokenTransfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) internal virtual override {
        bool hasBeenTransferred = tokenTransferred[_tokenId];
        bool isMint = (_from == address(0));
        if (!isMint && !hasBeenTransferred) {
            tokenTransferred[_tokenId] = true;
            mint();
        }
    }
}
