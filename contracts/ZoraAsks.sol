// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./IAsksV1_1.sol";
import "./IZoraModuleManager.sol";

contract ZoraAsks {
    // Address of Zora V3 Module (Asks V1.1)
    address public zoraAsksV1_1;

    // Address of Zora Transfer Helper (ERC721)
    address public zoraTransferHelper;

    // Address of Seller Funds Recipient (0xSplit)
    address public sellerFundsRecipient;

    constructor(
        address _zoraAsksV1_1,
        address _zoraTransferHelper,
        address _zoraModuleManager,
        address _sellerFundsRecipient
    ) {
        zoraAsksV1_1 = _zoraAsksV1_1;
        zoraTransferHelper = _zoraTransferHelper;
        sellerFundsRecipient = _sellerFundsRecipient;
        IZoraModuleManager(_zoraModuleManager).setApprovalForModule(
            _zoraAsksV1_1,
            true
        );
    }

    /// @notice Creates the ask for a given NFT using Zora V3 Module (Asks V1.1)
    function createAsk() public {
        IAsksV1_1(zoraAsksV1_1).createAsk(
            address(this),
            1,
            1,
            address(0),
            sellerFundsRecipient,
            1000
        );
    }
}
