# Scholar Trust (VeriChain)

Scholar Trust is a blockchain credential verification dApp. It allows authorized issuers to mint credentials on-chain and lets anyone verify authenticity using a token ID.

## Project Overview

The application is a React + Vite frontend that connects to an Ethereum smart contract through MetaMask and Ethers.js.

### Core Capabilities

- Connect a wallet with MetaMask.
- Initialize the app with a deployed contract address.
- Issue credentials (issuer-only operation).
- Verify credentials by token ID.
- Read wallet/network status and issuer role.
- Revoke credentials from the contract (supported in Web3 utilities).

## Tech Stack

- **Frontend:** React 19, Vite  
- **Routing:** React Router  
- **Blockchain Integration:** Ethers.js  
- **Wallet:** MetaMask (`window.ethereum`)  
- **Smart Contract Interface:** ABI loaded in frontend utilities  

## Repository Structure

```text
.
├── README.md
└── frontend/
    ├── src/
    │   ├── components/      # UI components (navbar, issue, verify, hero)
    │   ├── pages/           # Home page flow
    │   ├── utils/           # web3 helpers + ABI
    │   └── styles/          # CSS files
    ├── index.html           # includes ethers script
    └── package.json
```

## Prerequisites

Before running the app, make sure you have:

- Node.js 18+
- npm
- MetaMask browser extension
- Access to an Ethereum network (for example Sepolia)
- A deployed smart contract address compatible with the included ABI

## Local Setup

From the repository root:

cd frontend  
npm install  
npm run dev  

Then open the local URL printed by Vite (usually `http://localhost:5173`).

## Build and Preview

cd frontend  
npm run build  
npm run preview  

## Lint

cd frontend  
npm run lint  

## How to Use

1. Open the app and click **Connect Wallet**.  
2. Approve MetaMask connection.  
3. Confirm or enter your deployed contract address, then initialize.  
4. If your wallet has issuer permissions, use **Issue Credential**.  
5. Use **Verify Credential** with a token ID to validate a record.  

## Notes

- Issuance and revocation are write operations and require gas fees.  
- Verification reads are view operations and do not require gas from the user.  
- Keep network selection in MetaMask aligned with your deployed contract network.  