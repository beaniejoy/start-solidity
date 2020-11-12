pragma solidity 8.4.23;

contract Vote {
    
    struct candidator {
        string name;
        uint upVote;
    }
    
    // variable
    candidator[] public candidatorList;
    
    // mapping
    
    // event
    event AddCandidator(string name);
    
    // modifier
    
    // constructor
    
    // candidator
    function addCandidator(string _name) public {
        require(candidatorList.length < 5)
        candidatorList.push(candidator(_name, 0));
        
        // emit event
        emit AddCandidator(_name);
        
    }
    
    // voting
    function Voting() public {
        
    }
    
    // finish vote
    function finishVote() public {
        
    }
}
