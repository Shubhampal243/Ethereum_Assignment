const HDWalletProvider = require("truffle-hdwallet-provider");
require('dotenv').config();
module.exports = {
     // See <http://truffleframework.com/docs/advanced/configuration>
     // to customize your Truffle configuration!
     networks: {
          ganache: {
               host: "localhost",
               port: 7545,
               network_id: "*" // Match any network id
          },
          rinkeby: {
            host: "127.0.0.1",
            port: 8545,
            network_id: 4,
            from: '0x2Ecc70DB8fC53267F0f783e629051D50882d7CBf',
            gas: 4000000,
          },
          ropsten: {
          provider: function () {
             return new HDWalletProvider(process.env.MNEMONIC, "https://ropsten.infura.io/v3/" + process.env.INFURA_API_KEY);
          },
          network_id: 3,
          gas: 4500000,
          gasPrice: 10000000000
       }
     }
};