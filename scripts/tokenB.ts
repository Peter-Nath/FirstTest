import { ethers } from "hardhat";

async function main() {
  const tokenB = await ethers.deployContract("TokenB");
  await tokenB.waitForDeployment();

  console.log(tokenB.target);

  const MyAddr = "0x5d87E96eac67D085f7d94d3386e3d81C602A5461";
  const amount = ethers.parseEther("100000000");
  const addr = "0xF7b790e741aa392728DD333bd11788245368E083";

  const token = await ethers.getContractAt("ITokenA", addr);
  await token.mint(MyAddr, amount);
}
// token address ==> 0xF7b790e741aa392728DD333bd11788245368E083

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
