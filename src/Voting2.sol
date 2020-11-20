// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7;
pragma experimental ABIEncoderV2;

contract Voting {
    // constructor to initialize candidates
    // vote for candidates
    // get count of votes for each candidates
    
    string[] public candidateList;
    mapping(string => uint8) public votesReceived;
    
    constructor(string[] memory candidateNames) {
        candidateList = candidateNames;
    }
    
    // when the contract is initialized,
    // this(votesReceived[candidate]) is by default set to zero
    function voteForCandidate(string memory candidate) public {
        // whether candidate is valid or not
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }
    
    // read only call
    // view: mark this function as a read only function (modifier)
    function totalVotesFor(string memory candidate) view public returns(uint8) {
        return votesReceived[candidate];
    }
    
    function validCandidate(string memory candidate) view public returns(bool) {
        for(uint i=0; i < candidateList.length; i++) {
            // how to compare spring type
            if(keccak256(abi.encodePacked(candidateList[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }
}