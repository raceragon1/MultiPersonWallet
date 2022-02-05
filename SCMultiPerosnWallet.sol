// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;


contract MultiPersonWallet {

    //Making the set of people 
    address[] public Participants;
    

    //the contract deployer and Mainman who is in charge
    address payable public bossman;  //deployer



    constructor(){
        bossman = payable(msg.sender);
    }

    mapping (address=>bool) owners;

    // adding a person to the wallet          //Works
    function addparticipant(address _participant) public {
        require(msg.sender == bossman);
        Participants.push(_participant);
        owners[_participant] = true;      
    }

    uint NumberofdecidingVotes = (Participants.length)/2;

    modifier Owners{
        require( owners[msg.sender]);
        _;
    }

    //adding money and viewing the contract balance     //works
    function addMoney() public payable{}    

    function contractbalance() view public returns(uint){
       return address(this).balance;
    }



    //requests
    struct Requests {
        uint value;
        address payable recipient;
        string reason;
        uint votecount;
        bool Completed;
    }

    //Request[] public RequestArray;
    mapping (uint => Requests) public RequestsArray;

    //View current requests 

    //requesting to transfer money
    function request(uint _requestno, uint _value,address payable _to, string memory _reason) public Owners {
     RequestsArray[_requestno]= Requests(_value, _to, _reason,0,false);

    }

    //vote 
    
    //struct AllVotes{
    //  address Voter;
    //  bool Voted;    
    //}
    
    mapping(uint => mapping(address => bool)) votes;

    function vote(uint _requestno) public Owners {
        require(votes[_requestno][msg.sender] = false);

        RequestsArray[_requestno].votecount += 1;
        votes[_requestno][msg.sender] =true;
    }

    //sending money form the contract
    function sendmoney(uint _requestno) public Owners payable{
        if (RequestsArray[_requestno].votecount >= NumberofdecidingVotes){
            (RequestsArray[_requestno].recipient).transfer(RequestsArray[_requestno].value);
            RequestsArray[_requestno].Completed = true;
        }
        
    }






}