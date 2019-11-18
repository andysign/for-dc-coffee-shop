pragma solidity ^0.4.22;


contract Coffeeshop {

	string internal name = "Bob's Coffees";
	address public owner;
	enum ItemsList {
		Americano, Latte, Cappuccino
	}
	uint256[] public itemPrices = new uint[](3);
	string[] public itemNames = new string[](3);

	event SoldItem(string item, address indexed buyerAddress, address indexed shopOwnerAddress);
	event RestGiven(uint256 indexed weiAmount, address indexed receiverAddress);

	modifier onlyOwner() { // Modifier for ownable functions
		require(msg.sender == owner);
		_;
	}

	constructor () public {
		owner = msg.sender; // constructor set owner
		itemPrices[uint8(ItemsList.Americano)] = 2 ether;
		itemPrices[uint8(ItemsList.Latte)]     = 3 ether;
		itemPrices[uint8(ItemsList.Cappuccino)]= 5 ether;
		itemNames[uint8(ItemsList.Americano)] = "Americano";
		itemNames[uint8(ItemsList.Latte)]     = "Latte";
		itemNames[uint8(ItemsList.Cappuccino)]= "Cappuccino";
	}

	function buyItem(uint8 _i) internal { // Buy item 0..2
		uint8 i = _i; // Index
		if (msg.value < itemPrices[i]) { // Check underpayment
			revert("Not enoguth money to buy the desired item!");
		} else {
			emit SoldItem( itemNames[i], msg.sender, owner );
			if (msg.value > itemPrices[i]) { // Check overpayment
				msg.sender.transfer(msg.value - itemPrices[i]); // Send rest
				emit RestGiven(msg.value - itemPrices[i], msg.sender);
			}
		}
	}

	function buyAmericano() payable public { buyItem(uint8(ItemsList.Americano)); }

	function buyLatte() payable public { buyItem(uint8(ItemsList.Latte)); }

	function buyCappuccino() payable public { buyItem(uint8(ItemsList.Cappuccino)); }

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
