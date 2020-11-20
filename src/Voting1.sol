// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7;

contract Voting1 {
    
    struct candidator {
        string name;
        uint upVote;
    }
    
    // variable
    bool live; // for checking whether the Vote is valid or not 
    address owner; // who makes the Vote.
    candidator[] public candidatorList; // enrolled canditators list in the Vote
    
    // mapping
    // whether voting is done or not
    mapping(address => bool) Voted; // key: address, value: bool
    
    // event
    event AddCandidator(string name);
    event UpVote(string candidator, uint upVote);
    event FinishVote(bool live);
    event Voting(address owner);
    
    // modifier
    // for controlling finishVote.
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    // constructor
    constructor() {
        owner = msg.sender;
        live = true; // not yet voting
        
        emit Voting(owner);
    }
    
    // enroll candidator
    function addCandidator(string memory _name) public onlyOwner{
        require(live == true);
        require(candidatorList.length < 5); // because of gas cost, limit 5 candidators
        candidatorList.push(candidator(_name, 0));
        
        // announce the event
        emit AddCandidator(_name);
        
    }
    
    // voting
    function upVote(uint _indexOfCandidator) public {
        require(live == true);
        require(_indexOfCandidator < candidatorList.length);
        require(Voted[msg.sender] == false);
        candidatorList[_indexOfCandidator].upVote++;
        
        // check voting done
        Voted[msg.sender] = true;
        
        // announce voting infomation
        emit UpVote(candidatorList[_indexOfCandidator].name, candidatorList[_indexOfCandidator].upVote);
    }
    
    // finish vote
    function finishVote() public onlyOwner {
        live = false;
        
        // announce finishing Vote totally
        emit FinishVote(live);
    }
}
