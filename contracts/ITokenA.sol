 // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ITokenA {
  function mint(address to, uint amount) external;
    function name(string memory name) external;
    function symbol(string memory symbol) external;
    function balanceOf(address _addr) external view returns(uint balance) ;
    function transfer(address recipient, uint256 amount) external returns (bool success);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool success);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}