const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const web3 = new Web3(ganache.provider());

const compiled = require("../build/Verification.json")

let accounts;
let verf;

beforeEach(async () => {
  // Get a list of all accounts
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

  it("TEST_method candidateHandler should get values to map", async() => {
    await verf.methods.institutionHandler("test",1234,"test","etee",123).send({from: accounts[0], gas:1000000});
  });

});
