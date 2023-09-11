// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenA is ERC20, Ownable{

constructor() ERC20("Atoken", "ATK"){}

function mint(address _to, uint _amount)  public onlyOwner {
    _mint(_to, _amount);
} 

}