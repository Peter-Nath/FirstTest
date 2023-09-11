// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {IERC20} from "./IERC20.sol";

contract SwapToken {
    address owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint ReservedA;
    uint ReservedB;
    uint Liquidity;
    uint k;

    struct LiquidityProvider {
        uint AmountA;
        uint AmountB;
    }

    mapping(address => LiquidityProvider) liquidityProvider;
    mapping(address => uint) liquidity;

constructor(address _tokenA, address _tokenB) {
    tokenA = IERC20(_tokenA);
    tokenB = IERC20(_tokenB);
}

function addLiquidity(uint _amountA, uint _amountB) external {
    tokenA.transferFrom(msg.sender, address(this), _amountA);
    tokenB.transferFrom(msg.sender, address(this), _amountB);
    ReservedA += _amountA;
    ReservedB += _amountB;

    LiquidityProvider storage provider = liquidityProvider[msg.sender];
    provider.AmountA += _amountA;
    provider.AmountB += _amountB;
    liquidity[msg.sender] = _amountA * _amountB;
    k += liquidity[msg.sender]; //incase another person comes to stake, i am not sure, i will ask mentor
    owner = msg.sender;
}

function removeLiquidity(uint _amountA, uint _amountB) external {
   require(owner == msg.sender, "You no add liquidity, you won withraw, no be so nah");
   
    LiquidityProvider storage provider = liquidityProvider[msg.sender];
    require(provider.AmountA >= _amountA, "Insufficient balance of A in thr pool");
    require(provider.AmountB >= _amountB, "Insufficient amount of B in the pool");
    
    ReservedA -= _amountA; //deduct the reserve of tokenA
    ReservedB -= _amountB; //deduct the reserve of tokenB

    provider.AmountA -= _amountA; //deduct from his balanceA in struct
    provider.AmountB -= _amountB; //deduct from his balanceB in struct

    liquidity[owner] =  _amountA * _amountB;
    

    tokenA.transfer(owner, _amountA); //transfer from the contract to the owners address
    tokenB.transfer(owner, _amountB);   //transfer tokenB from the contract to the owners address
   

    k = liquidity[owner];
}

function swapAforB(uint amounta, address receiver) external {
    uint K = ReservedA * ReservedB;
    uint amountB = (K * amounta) / (ReservedA + amounta) * ReservedA;
   require(ReservedB >= amountB, "pool is short of required amount, reduce your input");

   tokenA.transferFrom(msg.sender, address(this), amounta);
   tokenB.transfer(receiver, amountB);

   ReservedA += amounta;
   ReservedB -= amountB;
}

function swapBforA(uint amountb, address receiver) external {
    uint K = ReservedA * ReservedB;
    uint amountA = (K * amountb) / (ReservedB + amountb) * ReservedB;
    require(ReservedA >= amountA, "pool is short of desired token amount, reduce your input");

    tokenB.transferFrom(msg.sender, address(this), amountb);
    tokenA.transfer(receiver, amountA);

    ReservedA -= amountA;
    ReservedB += amountb;
      
}

 }