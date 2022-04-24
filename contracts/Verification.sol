pragma solidity ^0.4.17;

contract Verification {
    struct CandidateRequest{
        int ssn;
        string firstName;
        string lastName;
        string homeAddress;
        string uni;
    }

    struct DegreeInfo {
        string university;
        string degreeName;
        string major;
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
        DegreeInfo[] degreeInfo;
    }

    // mapping when candidate joins the contract
    mapping(int => DegreeInfo[]) public storeCandidateDegreeInfo;
    mapping(int => CandidateRequest) public storeCandidateInfo;
     
    address public manager;
    function Verification() public {
        manager = msg.sender;
    }

    function candidateHandler(int ssn,  string firstName,  string lastName, string homeAddress, string uni) public {
        CandidateRequest storage newCandidate;
        newCandidate.ssn = ssn;
        newCandidate.firstName = firstName;
        newCandidate.lastName = lastName;
        newCandidate.homeAddress = homeAddress;
        newCandidate.uni = uni;
        storeCandidateInfo[ssn] = newCandidate;
    }

    function institutionHandler(string university, int ssn, string degreeName, string major, int year) public {
        DegreeInfo storage newDegree;
        newDegree.university = university;
        newDegree.degreeName = degreeName;
        newDegree.major = major;
        newDegree.year = year;
        storeCandidateDegreeInfo[ssn].push(newDegree); 
    }

    // function employerHandler(int ssn, string firstName, string lastName) public returns(EmployerReponse) {
    //     EmployerReponse storage newEmployerResponse;
    //     newEmployerResponse.candidateInfo = storeCandidateInfo[ssn];
    //     newEmployerResponse.degreeInfo = storeCandidateDegreeInfo[ssn];
    //     return newEmployerResponse;
    // }
}