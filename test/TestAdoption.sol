pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
	// Get the address of adoption contract
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	// dummy id of pet for testing
	uint expectedPetId = 8;

	// Owner of adopted pet is this contract, this here means the address of TestAdoption contract
	address expectedAdopter = address(this);

	function testUserCanAdoptPet() public {
		uint returnedId = adoption.adopt(expectedPetId);
		Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned");
	}

	function testGetAdopterAddressByPetId() public {
		address adopter = adoption.adopters(expectedPetId);
		Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
	}

	function testGetAdopterAddressByPetIdInArray() public {
		// store adopters in memory and not in contract storage
		address[16] memory adopters = adoption.getAdopters();
		Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
	}

}
