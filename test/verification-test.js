const Verification = artifacts.require('Verification.sol');

const mockCandidate = {
    '0': '1234',
    '1': 'monirul',
    '2': 'islam',
    '3': '1234Street',
    '4': '1234UNI',
    ssn: '1234',
    firstName: 'monirul',
    lastName: 'islam',
    homeAddress: '1234STREET',
    uni: '1234UNI'
  }
  

contract('Verification', () => {

    it('TEST_deploys a contract', async()=> {
        const verf = await Verification.deployed();
        console.log(verf.address);
        assert(verf.address != '');
    });

    it('TEST_method candidateHandler should set values to map storeCandidateInfo', async()=> {
        const verf = await Verification.deployed();
        await verf.candidateHandler(1234,"monirul","islam","1234STREET","1234UNI");
        const result = await verf.storeCandidateInfo(1234)
        assert.equal(result['ssn'], mockCandidate['ssn'])
        assert.equal(result['firstName'], mockCandidate['firstName'])
        assert.equal(result['lastName'], mockCandidate['lastName'])
        assert.equal(result['homeAddress'], mockCandidate['homeAddress'])
        assert.equal(result['uni'], mockCandidate['uni'])
    });

});