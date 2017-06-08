var Web3 = require("web3")  //get web3 object
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545")) //use it to hook into the testrpc running on port 8545
var solc = require("solc")  //get the solidity compiler object

var source = 'copy paste contract between grave ticks'


//set up accounts
var buyer = web3.eth.accounts[0]
var seller = web3.eth.accounts[1]
var arbiter = web3.eth.accounts[2]

var compiled = solc.compile(source)  //compile the contract
var bytecode = compiled.contracts[':Escrow'].bytecode   //get the bytecode of the contract
var abi = JSON.parse(compiled.contracts[':Escrow'].interface)
var escrowContract = web3.eth.contract(abi); //build new contract

//deploy contract
var deployed = escrowContract.new(seller, arbiter, {
    from: buyer,
    data:bytecode, 
    gas: 4700000, 
    gasPrice: 5
}, (error, contract) => {})

deployed.address  //check the contract address



