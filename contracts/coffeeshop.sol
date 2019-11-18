pragma solidity ^0.4.22;


contract Coffeeshop {

	string internal name = "Bob's Coffees";
	address public owner;
	uint256 internal itemOnePrice = 2 ether; // Americano
	uint256 internal itemTwoPrice = 3 ether; // Latte
	uint256 internal itemThreePrice = 5 ether; // Cappuccino

	event SoldAmericano(address indexed buyerAddress, address indexed shopOwnerAddress);
	event RestGiven(uint256 indexed amountInWei, address indexed receiverAddress);

	modifier onlyOwner() { // Modifier for ownable functions
		require(msg.sender == owner);
		_;
	}

	constructor () public {
		owner = msg.sender; // constructor set owner
	}

	function buyAmericano () payable public {
		if (msg.value < itemOnePrice) { // Check underpayment
			revert("Not enoguth money to buy the desired item!");
		} else {
			emit SoldAmericano( msg.sender, owner );
			if (msg.value > itemOnePrice) { // Check overpayment
				msg.sender.transfer(msg.value - itemOnePrice); // Send rest
				emit RestGiven(msg.value - itemOnePrice, msg.sender);
			}
		}
	}

	function () external payable {
		buyAmericano(); // By default assume user wants Americano
	}

	function withdraw() onlyOwner public returns (bool) {
		return owner.send( // Made for owner to withdraw money
			address(this).balance
		);
	}

	function getName() public view returns (string) {
		return name;
	}

	function getBalance() public view returns (uint256) {
		return address(this).balance;
	}

	function getBalanceEth() public view returns (uint256) {
		return getBalance() / 1 ether;
	}

}
