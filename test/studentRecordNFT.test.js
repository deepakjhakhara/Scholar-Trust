const StudentRecordNFT = artifacts.require('StudentRecordNFT');

contract('StudentRecordNFT', (accounts) => {
  const [admin, recipient] = accounts;

  it('issues and verifies a credential', async () => {
    const c = await StudentRecordNFT.deployed();

    await c.issueCredential(
      recipient,
      0,
      'BSc Computer Science',
      'Scholar University',
      0,
      web3.utils.keccak256('record-1'),
      'ipfs://record-1',
      { from: admin }
    );

    const total = await c.totalCredentials();
    assert.equal(total.toString(), '1', 'total credentials should be incremented');

    const isValid = await c.isValid(0);
    assert.equal(isValid, true, 'record should be valid');

    const cred = await c.getCredential(0);
    assert.equal(cred.title, 'BSc Computer Science');
    assert.equal(cred.recipient, recipient);
  });
});
