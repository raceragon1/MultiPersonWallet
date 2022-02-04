// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;


contract MultiPersonWallet {

    //Making the set of people 
    struct Participant{
        address participant;
        bool voted;
    }

    Participant[] public participantsArray;

    //the contract deployer and Mainman who is in charge
    address payable public bossman;  //deployer

    constructor(){
        bossman = payable(msg.sender);
    }

    // adding a person to the wallet
    function addparticipant(address _participant) public {
        require(msg.sender == bossman);

        participantsArray.push(Participant(_participant, false));
    }

   // mapping(address => Participant) public participants;

   
    //adding money and viewing the contract balance     //works
    function addMoney() public payable{}    

    function contractbalance() view public returns(uint){
       return address(this).balance;
    }

    //requests
    struct Requests {
        uint value;
        address recipient;
        string reason;
    }

    Requests[] public RequestsArray;

    //View current requests 

    //requesting to transfer money
    function request(uint value) view public {

    }

    //sending money form the contract
    function sendmoney(uint value, address payable to) public payable{

    }






}