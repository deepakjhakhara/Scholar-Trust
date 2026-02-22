# Scholar Trust

**Decentralised System For Student Records**

Scholar Trust is a decentralized application for issuing, storing, and verifying student academic records on blockchain infrastructure.

## Architecture

- **Frontend (`frontend/`)**: React + Vite dApp UI (MetaMask integration)
- **Backend (root)**: Solidity smart contract + Truffle deployment/test toolchain

## Prerequisites

- Node.js 18+
- npm
- MetaMask extension
- Ganache (CLI or GUI)

## 1) Install dependencies

### Backend (Truffle + contracts)

```bash
npm install
```

### Frontend

```bash
cd frontend
npm install
cd ..
```

## 2) Start local blockchain (Ganache)

```bash
npm run ganache
```

This starts a local chain on `http://127.0.0.1:8545` (chain ID `1337`).

## 3) Deploy contract with Truffle

In a new terminal:

```bash
npm run migrate:reset
```

This compiles and deploys `StudentRecordNFT.sol` to the `development` network configured in `truffle-config.js`.

## 4) Sync ABI to frontend

```bash
npm run sync:abi
```

This updates `frontend/src/utils/contractABI.js` from the compiled Truffle artifact.

> One-command local deployment:

```bash
npm run deploy:local
```

## 5) Configure MetaMask for Ganache

- Network name: `Ganache Local`
- RPC URL: `http://127.0.0.1:8545`
- Chain ID: `1337`
- Currency: `ETH`
- Import one Ganache account private key

## 6) Run frontend

```bash
cd frontend
npm run dev
```

Open the shown local Vite URL.

## 7) Initialize contract in app

1. Click **Connect Wallet**.
2. Paste deployed contract address from Truffle output.
3. Click **Initialize Contract**.

## Useful commands

```bash
npm run compile         # Compile contracts
npm run migrate         # Deploy without reset
npm run migrate:reset   # Re-deploy from scratch
npm run test            # Run Truffle tests
npm run sync:abi        # Update frontend ABI from build artifact
```
