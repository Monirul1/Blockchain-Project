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
        string major;
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

    string[] public testArr;

    address public manager;

    function Verification() public {
        manager = msg.sender;
    }

    function candidateHandler(int ssn,  string firstName,  string lastName, string homeAddress, string uni) public {
        DegreeInfo[] currDegree;
        currDegree.push(DegreeInfo("test","test1","tes2",2020));
        
        CandidateRequest storage req;
        req.ssn = ssn;
        req.firstName = firstName;
        req.lastName = lastName;
        req.homeAddress = homeAddress;
        req.uni = uni;
        req.degree = currDegree;

        storeCandidateInfo[req.ssn] = req; 

        testArr[0]=storeCandidateInfo[req.ssn].degree[0].university;
    }

    function institutionHandler(string university, int ssn, int uni, string degreeName, string major, int year) public {
        DegreeInfo memory newDegree = DegreeInfo({
           university: university,
           degreeName: degreeName,
           major: major,
           year: year
        });
       CandidateRequest storage candidate = storeCandidateInfo[ssn];
       candidate.degree.push(newDegree);
    }
}