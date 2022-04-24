const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const web3 = new Web3(ganache.provider());
const { interface, bytecode } = require("../compile");

let accounts;
let verf;

beforeEach(async () => {
  // Get a list of all accounts
  accounts = await web3.eth.getAccounts();
  verf = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({
      data: bytecode,
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
