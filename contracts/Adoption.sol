pragma solidity ^0.5.0;

contract Adoption {
	address[16] public adopters;

	function adopt(uint petId) public returns (uint) {
		// this must be true, or nothing executes
		require(petId >= 0 && petId <= 15);

		//msg.sender is sender's address
		adopters[petId] = msg.sender;

		return petId;
	}

	// the return type here specifies data location of that value
	// view means this function will not modify the state of the contract
	function getAdopters() public view returns (address[16] memory) {
		return adopters;
	}


}
