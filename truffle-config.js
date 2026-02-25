require('dotenv').config();

module.exports = {
  networks: {
    development: {
      host: process.env.RPC_HOST || '127.0.0.1',
      port: Number(process.env.RPC_PORT || 8545),
      network_id: Number(process.env.NETWORK_ID || 1337)
    },
    ganache: {
      host: process.env.RPC_HOST || '127.0.0.1',
      port: Number(process.env.RPC_PORT || 8545),
      network_id: Number(process.env.NETWORK_ID || 1337)
    }
  },
  mocha: {
    timeout: 100000
  },
  compilers: {
    solc: {
      version: '0.8.20',
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
};
