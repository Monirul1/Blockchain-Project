pragma solidity >=0.4.22 <0.9.0;

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
        DegreeInfo degreeInfo;
    }

    // mapping when candidate joins the contract
    mapping(int => DegreeInfo) public storeCandidateDegreeInfo;
    mapping(int => CandidateRequest) public storeCandidateInfo;
     
    address public manager;
    constructor() {
        manager = msg.sender;
    }

    function candidateHandler(int ssn,  string memory firstName,  string memory lastName, string memory homeAddress, string memory uni) public {
        storeCandidateInfo[ssn] = CandidateRequest(ssn, firstName, lastName, homeAddress, uni);
    }

    function institutionHandler(string memory university, int ssn, string memory degreeName, string memory major, int year) public {
        storeCandidateDegreeInfo[ssn] = DegreeInfo(university, degreeName, major, year);
    }

    function employerHandler(int ssn) public view returns(string memory, string memory, string memory, string memory, string memory, int  ) {
        string memory firstName = storeCandidateInfo[ssn].firstName;
        string memory lastName = storeCandidateInfo[ssn].lastName;
        string memory university = storeCandidateDegreeInfo[ssn].university;
        string memory major = storeCandidateDegreeInfo[ssn].major;
        string memory degreeName = storeCandidateDegreeInfo[ssn].degreeName;
        int year = storeCandidateDegreeInfo[ssn].year;
        return (firstName,lastName,university,major,degreeName,year);
    }
}