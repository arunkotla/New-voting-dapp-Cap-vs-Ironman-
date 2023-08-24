// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Voting{

    struct Voter {
        string name;
        address account;
        bool hasVoted;
    }

    mapping(address => Voter) votes;

    uint public teamCapvotes;
    uint public teamIronmanvotes;
    
    
    function vote_for_Ironman(string memory _name) public {
        require(votes[msg.sender].hasVoted == false, "Already casted a vote");
        votes[msg.sender].hasVoted = true;
        votes[msg.sender].account = msg.sender;
        votes[msg.sender].name = _name;
        teamIronmanvotes++;
        emit VoterDetails (_name,  msg.sender, true);
    }

    function vote_for_Cap(string memory _name) public {
        require(votes[msg.sender].hasVoted == false, "Already casted a vote");
        votes[msg.sender].hasVoted = true;
        votes[msg.sender].account = msg.sender;
        votes[msg.sender].name = _name;
        teamCapvotes++;
        emit VoterDetails (_name,  msg.sender, true);
    }

    event VoterDetails (string name, address account, bool hasVoted);

    function result() public view returns(uint, uint){
        return (teamCapvotes, teamIronmanvotes); 
    }

    
}