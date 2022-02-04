// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;


contract MultiPersonWallet {

    struct Participant{
        address participant;
        uint vote;
        bool voted;
    }

    address public Mainman;

    constructor(){
        msg.sender == Mainman;
    }

    function addparticipant(address _participant) public {
        require(msg.sender == Mainman);
        participants.pati
    }

    mapping(address => Participant) public participants;

    function contractbalance() view public returns(uint){
       return address(this).balance;
    }

    function addMoney(uint value) public payable{}

    function sendmoney(uint value, address payable to) public payable{

    }






}