const StudentRecordNFT = artifacts.require('StudentRecordNFT');

module.exports = async function (deployer) {
  await deployer.deploy(StudentRecordNFT);
};
