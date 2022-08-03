// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "onchain-music-metadata/contracts/OnChainMusicMetadata.sol";

contract Single is OnChainMusicMetadata {
    function setupSongMetadata() internal {
        songs[1].song = SongContent(getAudio(), getImage());
        songs[1].songPublishingData = getPublishingData();
    }

    function setupProjectMetadata() internal {
        string memory projectType = "Single";
        string memory upc = "197084937800";
        _projectMetadata = ProjectMetadata(
            getPublishingData(),
            getImage(),
            projectType,
            upc
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
        tags[1].push("electronic");
        tags[1].push("experimental");
        tags[1].push("EDM");
        tags[1].push("psychedelic");
        tags[1].push("glitch hop");
        tags[1].push("glitch");
        tags[1].push("bass");
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
        string
            memory description = "Infinati\x27s new single \x27Keep it Heady\x27 is self-explanatory. Stay in a good vibration and beautiful things will unfold. As always I encourage you to listen with your eyes closed, pry open your third eye, and have an entheogenic journey.\x5Cn\x5CnI had a lot of fun producing this and recording the sample you hear, \x27Keep it Heady\x27, as well as collaborating with sweetman.eth on this custom smart contract.\x5Cn\x5CnUpon purchasing this NFT not only do you support Infinati and sweetman.eth with some food in our bellies, but Infinati will airdrop a free music NFT for you. Previous holders may already hold this free NFT, so in the event that the supply of 50 runs out, you\x27ll just get the next free music NFT that I mint! Reach out to @infinatimusic on Twitter so I airdrop it to the correct address and so we can stay in touch. :)\x5Cn\x5CnEndless love to everyone. Infinati is here to stay. Music is my first love, I\x27m basically married to it.";
        string memory recordLabel = "Infinati Records";
        string memory publisher = "Infinati";
        string memory location = "Las Vegas, NV";
        string memory releaseDate = "August 5, 2022";
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
        uint256 duration = 209;
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
        string memory externalUrl = "https://twitter.com/infinatimusic";
        string memory isbc = "QZMEQ2242591";
        string memory genre = "Electronic";

        return AudioQualitative(license, externalUrl, isbc, genre);
    }
}
