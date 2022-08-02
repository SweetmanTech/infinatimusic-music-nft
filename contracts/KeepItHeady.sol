// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "onchain-music-metadata/contracts/OnChainMusicMetadata.sol";

contract KeepItHeady is OnChainMusicMetadata {
    function setupSongMetadata() internal {
        songs[1].song = SongContent(getAudio(), getImage());
        songs[1].songPublishingData = getPublishingData();
    }

    function setupProjectMetadata() internal {
        _projectMetadata = ProjectMetadata(
            getPublishingData(),
            getImage(),
            "Single",
            "TODO"
        );
    }

    function setupCollaborators() internal {
        credits[1].push(Collaborator("Infinati", "creator"));
        credits[1].push(
            Collaborator("sweetman.eth", "smart contract engineer")
        );
    }

    function setupTags() internal {
        tags[1].push("Infinati");
        tags[1].push("cc0");
        tags[1].push("sweetman.eth");
        tags[1].push("Keep it Heady");
    }

    function getImage() public pure returns (Image memory) {
        string
            memory artworkUri = "ipfs://bafybeifw6kgkz5zgkq3mmgxxzf5vde4ed5zdo7xgnw2tdxmpoafzjs7eci";
        string memory artworkMimeType = "image/gif";
        return Image(artworkUri, artworkMimeType, "");
    }

    function getAudio() public pure returns (Audio memory) {
        string memory artist = "Infinati";
        string
            memory audioUri = "ipfs://bafybeifzmup6weah7qydntulodogahgtm7csmij7skvyhzutvgs2c7m3yy";

        SongDetails memory songDetails = SongDetails(
            artist,
            getAuctionQuantitative(),
            getAuctionQualitative()
        );
        Lyrics memory lyrics = Lyrics("Keep it heady", "");

        return Audio(audioUri, songDetails, lyrics);
    }

    function getPublishingData() internal pure returns (PublishingData memory) {
        string memory title = "Keep it Heady";
        string memory description = "TODO";
        string memory recordLabel = "Infinati Records";
        string memory publisher = "TODO";
        string memory location = "TODO";
        string memory releaseDate = "TODO";
        return
            PublishingData(
                title,
                description,
                recordLabel,
                publisher,
                location,
                releaseDate
            );
    }

    function getAuctionQuantitative()
        internal
        pure
        returns (AudioQuantitative memory)
    {
        string memory key = "A minor";
        uint256 bpm = 92;
        uint256 duration = 0;
        string memory audioMimetype = "audio/wav";
        uint256 trackNumber = 1;

        return
            AudioQuantitative(key, bpm, duration, audioMimetype, trackNumber);
    }

    function getAuctionQualitative()
        internal
        pure
        returns (AudioQualitative memory)
    {
        string memory license = "CC0";
        string
            memory externalUrl = "https://www.npmjs.com/package/onchain-music-metadata";
        string memory isbc = "CC-XXX-YY-TODO";
        string memory genre = "TODO";

        return AudioQualitative(license, externalUrl, isbc, genre);
    }
}
