# GameToken Smart Contract

## Overview
The `GameToken` is an ERC20 token used to redeem in-game items. It supports minting, burning, and redeeming tokens for specific items.

## Features
- **ERC20 Token**: Standard ERC20 functionality.
- **Minting**: Only the owner can mint new tokens.
- **Burning**: Token holders can burn their own tokens.
- **Redeem Items**: Players can redeem tokens for in-game items.
- **Check Redeemed Items**: Check the number of specific items a player has redeemed.
- **Display Store Items**: Display available in-game items and their token costs.

## Functions
- `mintTokens(address recipient, uint256 amount)`: Mint new tokens to the recipient (owner only).
- `burnTokens(uint256 amount)`: Burn tokens from the caller's balance.
- `redeemItem(uint256 itemId)`: Redeem tokens for a specific game item.
- `displayStoreItems()`: Display available items and their token costs.
- `checkPlayerRedeemedItems(address player, uint256 itemId)`: Check how many items a player has redeemed.

## Author
Milan Gupta
