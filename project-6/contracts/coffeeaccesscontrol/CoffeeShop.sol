pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CoffeeShopRole' to manage this role - add, remove, check
contract CoffeeShopRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event CoffeeShopAdded(address indexed account);
  event CoffeeShopRemoved(address indexed account);

  // Define a struct 'coffeeShops' by inheriting from 'Roles' library, struct Role
  Roles.Role private coffeeShops;

  // In the constructor make the address that deploys this contract the 1st coffeeshop
  constructor() public {
    _addCoffeeShop(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyCoffeeShop() {
    require(isCoffeeShop(msg.sender));
    _;
  }

  // Define a function 'isCoffeeShop' to check this role
  function isCoffeeShop(address account) public view returns (bool) {
    return coffeeShops.has(account);
  }

  // Define a function 'addRoaster' that adds this role
  function addCoffeeShop(address account) public onlyCoffeeShop {
    _addCoffeeShop(account);
  }

  // Define a function 'renounceCoffeeShop' to renounce this role
  function renounceCoffeeShop() public {
    _removeCoffeeShop(msg.sender);
  }

  // Define an internal function '_addCoffeeShop' to add this role, called by 'addCoffeeShop'
  function _addCoffeeShop(address account) internal {
    coffeeShops.add(account);
    emit CoffeeShopAdded(account);
  }

  // Define an internal function '_removeCoffeeShop' to remove this role, called by 'removeCoffeeShop'
  function _removeCoffeeShop(address account) internal {
    coffeeShops.remove(account);
    emit CoffeeShopRemoved(account);
  }
}