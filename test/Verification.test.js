const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const web3 = new Web3(ganache.provider());

const compiled = require("../build/Verification.json")

let accounts;
let verf;

// mock-data for tests, will move to a different .js file later
const mockCandidate = {
  '0': '1234',
  '1': 'monirul',
  '2': 'islam',
  '3': '1234Street',
  '4': '1234UNI',
  ssn: '1234',
  firstName: 'monirul',
  lastName: 'islam',
  homeAddress: '1234Street',
  uni: '1234UNI'
}


beforeEach(async () => {
  // get a list of all accounts
  accounts = await web3.eth.getAccounts();
  verf = await new web3.eth.Contract(JSON.parse(compiled.interface))
    .deploy({
      data: compiled.bytecode,
    })
    .send({ from: accounts[0], gas: "1000000" });
});

describe("Verification", () => {
  it("TEST_deploys a contract", () => {
    assert.ok(verf.options.address);
  });

  it("TEST_method candidateHandler should set values to map storeCandidateInfo", async() => {
    await verf.methods.candidateHandler(1234,"monirul","islam","1234Street","1234UNI").send({from: accounts[0], gas:1000000});
    verf.methods.storeCandidateInfo(1234).call(web3.eth.accounts[0], function(err, result){
      if(!err){
         assert.equal(result['ssn'], mockCandidate['ssn'])
         assert.equal(result['firstName'], mockCandidate['firstName'])
         assert.equal(result['lastName'], mockCandidate['lastName'])
         assert.equal(result['homeAddress'], mockCandidate['homeAddress'])
         assert.equal(result['uni'], mockCandidate['uni'])
      }
  });
  });

  it("TEST_method institutionHandler should set values to map", async() => {
    await verf.methods.institutionHandler("test",1234,"test","etee",123).send({from: accounts[0], gas:1000000});
  });

});


