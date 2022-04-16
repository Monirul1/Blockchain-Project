pragma solidity ^0.4.17;

contract Verification{
    struct CandidateRequest{
        int ssn;
        string firstName;
        string lastName;
        string homeAddress;
        string uni;
        DegreeInfo[] degree;
    }

    struct DegreeInfo {
        string university;
        string degreeName;
        int year;
    }

    struct InstitutionRequest{
        string institutionName;
        string firstName;
        string lastName;
        string uni;
        string degreeName;
        int year;
    }

    struct EmployerRequest{
        string firstName;
        string lastName;
        string ssn;
    }

    // response that will be sent to employer
    struct EmployerReponse {
        CandidateRequest candidateInfo;
        InstitutionRequest institutionInfo;
    }

    // mapping when candidate joins the contract
    mapping(int => CandidateRequest) public storeCandidateInfo;

    address public manager;

    function Verification() public {
        manager = msg.sender;
    }

    function candidateHandler(int ssn,  string firstName,  string lastName, string homeAddress, string uni) public {
       // maybe there is a better way, what I'm trying to do is initialize a typ degree struct so that I can 
       // add it to the CandidateRequest for initialization
        DegreeInfo memory degree = DegreeInfo({
           university: '',
           degreeName: '',
           year: 0
        });
        CandidateRequest storage req;
        req.ssn = ssn;
        req.firstName = firstName;
        req.lastName = lastName;
        req.homeAddress = homeAddress;
        req.uni = uni;
        req.degree.push(degree);

        storeCandidateInfo[req.ssn] = req; 
    }

}