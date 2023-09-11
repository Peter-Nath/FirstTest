import { ethers } from "hardhat";

async function main() {
  const factory = await ethers.deployContract("TokenA");
  await factory.waitForDeployment();
  console.log(factory.target);

  const MyAddr = "0x5d87E96eac67D085f7d94d3386e3d81C602A5461";
  const amount = ethers.parseEther("1000000");
  const addr = "0x247cdF86270f1c391Da65bcC4cC9580d37C0b27a";

  const tokenA = await ethers.getContractAt("ITokenA", addr);
  await tokenA.mint(MyAddr, amount);

  
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
