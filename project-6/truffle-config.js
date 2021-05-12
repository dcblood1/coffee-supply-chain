

const mnemonic = "";
const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "db14eaecc32143ad84e3e769cac50482"; // infura projectID

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      //port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, `https://rinkeby.infura.io/v3/${infuraKey}`),
        network_id: 4,       // rinkeby's id (4)
        gas: 4500000,        // rinkeby has a lower block limit than mainnet
        gasPrice: 10000000000
    }
  },
  compilers: {
    solc: {
      version: "0.4.24",    // Fetch exact version from solc-bin (default: truffle's version)
    }
  }

};