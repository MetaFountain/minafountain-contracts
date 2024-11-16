// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";

contract MinaFountain is Ownable, ERC20, ERC20Pausable {
	uint256 public initialSupply = 1000000 * 10 ** decimals();

	constructor() ERC20("MinaFountainToken", "MINAFOUNTAIN") {
		_mint(msg.sender, initialSupply);
	}

	function pause() public onlyOwner {
		_pause();
	}

	function unpause() public onlyOwner {
		_unpause();
	}

	function _beforeTokenTransfer(
		address from,
		address to,
		uint256 amount
	) internal override(ERC20, ERC20Pausable) {
		super._beforeTokenTransfer(from, to, amount);
	}
}
