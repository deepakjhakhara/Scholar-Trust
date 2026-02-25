const fs = require('fs');
const path = require('path');

const artifactPath = path.join(__dirname, '..', 'build', 'contracts', 'StudentRecordNFT.json');
const outputPath = path.join(__dirname, '..', 'frontend', 'src', 'utils', 'contractABI.js');

if (!fs.existsSync(artifactPath)) {
  throw new Error(`Artifact not found at ${artifactPath}. Run \`npm run compile\` first.`);
}

const artifact = JSON.parse(fs.readFileSync(artifactPath, 'utf8'));
const content = `// Auto-generated from Truffle artifact\nexport const CONTRACT_ABI = ${JSON.stringify(artifact.abi, null, 2)};\n`;

fs.writeFileSync(outputPath, content);
console.log(`ABI synced to ${outputPath}`);
