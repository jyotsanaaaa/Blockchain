// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract dao {

    struct Proposal{
        uint id;
        string description;
        uint amount;
        address payable receipient;
        uint votes;
        uint end;
        bool isExecuted;
    }

    mapping(address=>bool) private isInvestor;
    mapping(address=>uint) public numOfshares;
    mapping(address=>mapping(address=>bool)) public withdrawlStatus;
    address[] public investorsList;
    mapping(uint=>Proposal) public proposals;

    uint public totalsShares;
    uint public availableFunds;
    uint public contributionTimeEnd;
    uint public nextProposalId;
    uint public voteTime;
    uint public quorum;
    address public manager;

    constructor(uint _contibutionTimeEnd, uint _voteTime,uint _quorum){
        require(_quorum>0 && _quorum<100,"Not valid values");
        contributionTimeEnd=block.timestamp+_contibutionTimeEnd;
        voteTime=_voteTime;
        quorum=_quorum;
        manager=msg.sender;
    }
 }