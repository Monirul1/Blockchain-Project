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
        DegreeInfo[] degreeInfo;
    }

    // mapping when candidate joins the contract
    mapping(int => DegreeInfo[]) public storeCandidateDegreeInfo;
    mapping(int => CandidateRequest) public storeCandidateInfo;
     
    address public manager;
    // function Verification() public {
    //     manager = msg.sender;
    // }

    function candidateHandler(int ssn,  string memory firstName,  string memory lastName, string memory homeAddress, string memory uni) public {
        // CandidateRequest storage newCandidate;
        // newCandidate.ssn = ssn;
        // newCandidate.firstName = firstName;
        // newCandidate.lastName = lastName;
        // newCandidate.homeAddress = homeAddress;
        // newCandidate.uni = uni;
        // CandidateRequest memory newCandidate = CandidateRequest(ssn, firstName, lastName, homeAddress, uni);
        // CandidateRequest newCandidate;
        storeCandidateInfo[ssn] = CandidateRequest(ssn, firstName, lastName, homeAddress, uni);
    }

    function institutionHandler(string memory university, int ssn, string memory degreeName, string memory major, int year) public {
        // DegreeInfo storage newDegree;
        // newDegree.university = university;
        // newDegree.degreeName = degreeName;
        // newDegree.major = major;
        // newDegree.year = year;
        // storeCandidateDegreeInfo[ssn].push(newDegree); 
        // DegreeInfo memory newDegree = DegreeInfo(university, degreeName, major, year);
        storeCandidateDegreeInfo[ssn].push(DegreeInfo(university, degreeName, major, year));
    }

    // function employerHandler(int ssn, string firstName, string lastName) public returns(EmployerReponse) {
    //     EmployerReponse storage newEmployerResponse;
    //     newEmployerResponse.candidateInfo = storeCandidateInfo[ssn];
    //     newEmployerResponse.degreeInfo = storeCandidateDegreeInfo[ssn];
    //     return newEmployerResponse;
    // }
}