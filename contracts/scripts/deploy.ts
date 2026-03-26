import hre from "hardhat";

async function main() {
  const PopNFT = await hre.ethers.getContractFactory("PopNFT");

  const contract = await PopNFT.deploy();

  await contract.deployed();

  console.log("Contract deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});