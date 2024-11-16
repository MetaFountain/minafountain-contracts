// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";

contract MinaFountain is ERC20, ERC20Pausable, ERC20Permit {
	uint256 public initialSupply = 1000000 * 10 ** decimals();
	address public owner;

	constructor(
		address initialOwner
	)
		Ownable(initialOwner)
		ERC20("MinaFountainToken", "MINAFOUNTAIN")
		ERC20Permit("MINAFOUNTAIN")
	{
		_mint(msg.sender, initialSupply);
	}

	constructor()
		ERC20("MinaFountainToken", "MINAFOUNTAIN")
		Ownable(msg.sender)
	{
		_mint(msg.sender, initialSupply);
	}

	function pause() public onlyOwner {
		_pause();
	}

	function unpause() public onlyOwner {
		_unpause();
	}

	modifier onlyOwner() {
		require(msg.sender == owner, "Caller is not the owner");
		_;
	}
}
