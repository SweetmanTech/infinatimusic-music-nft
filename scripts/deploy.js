const hre = require("hardhat");

async function main() {
  const KeepItHeady = await hre.ethers.getContractFactory("KeepItHeady");
  // MUMBAI
  const musicNftImplementation = "0x807d90338744A78E8Fc51F0b1b00a30cF81D016a";

  const musicNft = await KeepItHeady.deploy(
    "Demo: Keep it Heady",
    "KiH",
    "0xcfBf34d385EA2d5Eb947063b67eA226dcDA3DC38",
    "0xCe6cEf2A9028e1C3B21647ae3B4251038109f42a",
    "0x909e9efE4D87d1a6018C2065aE642b6D0447bc91",
    "0x850A7c6fE2CF48eea1393554C8A3bA23f20CC401"
  );

  await musicNft.deployed();

  console.log("KeepItHeady deployed to:", musicNft.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
