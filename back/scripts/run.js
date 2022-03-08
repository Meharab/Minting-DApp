const { utils } = require("ethers");

async function main() {

    const [owner] = await hre.ethers.getSigners();

    const contractFactory = await hre.ethers.getContractFactory("NFTCollectible");

    const contract = await contractFactory.deploy();

    await contract.deployed();

    console.log("Contract deployed to:", contract.address);

    txn = await contract.mintNFT();
    await txn.wait()

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });