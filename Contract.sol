// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameToken is ERC20, Ownable {

    struct GameItem {
        string itemName;
        uint256 requiredTokens;
    }

    mapping(uint256 => GameItem) public gameItems;
    mapping(address => mapping(uint256 => uint256)) public playerRedeemedItems;

    constructor() ERC20("GameToken", "GTN") {
        // Set up in-game items and their required tokens
        gameItems[1] = GameItem("Legendary Sword", 1000 * 10 ** decimals());
        gameItems[2] = GameItem("Magic Shield", 750 * 10 ** decimals());
        gameItems[3] = GameItem("Health Potion", 200 * 10 ** decimals());
        gameItems[4] = GameItem("Mana Potion", 150 * 10 ** decimals());
    }

    // Function to mint new tokens, only accessible by the owner
    function mintTokens(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);
    }

    // Function to burn tokens
    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens");
        _burn(msg.sender, amount);
    }

    // Function to redeem tokens for game items
    function redeemItem(uint256 itemId) external {
        GameItem storage selectedItem = gameItems[itemId];
        require(bytes(selectedItem.itemName).length > 0, "Invalid item ID");
        require(balanceOf(msg.sender) >= selectedItem.requiredTokens, "Insufficient tokens to redeem item");

        _burn(msg.sender, selectedItem.requiredTokens);
        playerRedeemedItems[msg.sender][itemId] += 1;
    }

    // Function to display available store items
    function displayStoreItems() external pure returns (string memory) {
        return "1. Legendary Sword (1000 tokens)\n2. Magic Shield (750 tokens)\n3. Health Potion (200 tokens)\n4. Mana Potion (150 tokens)";
    }

    // Function to check the number of specific items a player has redeemed
    function checkPlayerRedeemedItems(address player, uint256 itemId) external view returns (uint256) {
        return playerRedeemedItems[player][itemId];
    }
}
