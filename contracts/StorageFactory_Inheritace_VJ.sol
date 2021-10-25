// SPDX-License-Identifier: MIT

pragma solidity  ^0.6.0;


//We will be calling a Simple_Storage_VJ contract from this contract. We need to tell Storage Factory contract to deploy contract from here
//Import is same as copy paste of code of smartcontract that is called.

import "./Simple_Storage_VJ.sol"; 
//This is the way to import any type of file or a contract.


contract StorageFactory is SimpleStorage { //Ineheritace, now we will have all variables and fuctions available directly inside StorageFactory
    //Deploy a contract from a contract
    
    //Create an array of type SimpleStorage contract.
    SimpleStorage[] public simpleStorageArray;
    
    //Create a public function to see values added in a smartcontract
    function createSimpleStorageContract() public {
        //Create an object of type createSimpleStorageContract
        SimpleStorage simpleStorage = new SimpleStorage();
        
        //Add simpleStorage to an array simpleStorageArray
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        //address - We can get the address from the simpleStorageArray
        //ABI Application Binary Interface - We can get this from Simple_Storage_VJ import
        //We are trying to call a store function to add favorite number on the address of an array with specific index.
        // SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        
        // simpleStorage.store(_simpleStorageNumber);
        //Above code can also be optimised as following, no need to declare a variable
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        // return simpleStorage.retrieve();
        
        //Above code can also be optimised as following, no need to declare a variable
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
    
}