import { ethers } from "hardhat";

async function main() {
  const tokenA = "0x3894147dE02d88569ee4a6ADc8A6C1f5fF35031C";
  const tokenB = "0xb8A9f70ed3EAa5E3f5877962A7866be1165B1507";

  const swap = await ethers.deployContract("SwapToken", [tokenA, tokenB]);
  await swap.waitForDeployment();
  console.log(`swap is deployed at ${swap.target}`); //swap addr ==> 0xEEFa352C5bb07C374757EBc0eA2C5903Ff7923D6
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
