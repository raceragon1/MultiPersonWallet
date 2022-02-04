// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;


contract MultiPersonWallet {

    struct Participant{
        address participant;
        bool voted;
    }

    Participant[4] public participantsArray;

    address public Mainman;

    constructor(){
        msg.sender == Mainman;
    }

    function addparticipant(address _participant) public {
        require(msg.sender == Mainman);
        participantsArray.push(Participant(_participant, false));
    }

    mapping(address => Participant) public participants;

    function contractbalance() view public returns(uint){
       return address(this).balance;
    }

    function addMoney(uint value) public payable{}

    function sendmoney(uint value, address payable to) public payable{

    }






}