import { ethers } from "hardhat";

async function main() {
    const tokenA = "0x3894147dE02d88569ee4a6ADc8A6C1f5fF35031C";
    const tokenB = "0xb8A9f70ed3EAa5E3f5877962A7866be1165B1507";
    const swapAddr = "0xfDFb3cC65F522789232bCeA20314FFb0A00F4Fe4";
    const signer = "0x5d87E96eac67D085f7d94d3386e3d81C602A5461"; 

    const contractA =await ethers.getContractAt("ITokenA", tokenA);
    const contractB =await ethers.getContractAt("ITokenB", tokenB);
    const swapContract = await ethers.getContractAt("SwapToken", swapAddr);
  
    const ImpersonatedSigner =await ethers.getImpersonatedSigner(signer);
    await contractA.connect(ImpersonatedSigner).

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });