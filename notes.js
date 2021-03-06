var Web3 = require("web3")  //get web3 object
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545")) //use it to hook into the testrpc running on port 8545
var solc = require("solc")  //get the solidity compiler object

var source = 'copy paste contract between grave ticks'


//set up accounts
var buyer = web3.eth.accounts[0]
var seller = web3.eth.accounts[1]
var arbiter = web3.eth.accounts[2]

var compiled = solc.compile(source)  //compile the contract
var bytecode = compiled.contracts.helloworld.bytecode   //get the bytecode of the contract
var abi = JSON.parse(compiled.contracts.helloworld.interface)
var escrowContract = web3.eth.contract(abi); //build new contract

//deploy contract
var deployed = escrowContract.new(seller, arbiter, {
    from: buyer,
    data:bytecode, 
    gas: 4700000, 
    gasPrice: 5,
    value: web3.toWei(5, 'ether')
}, (error, contract) => {})

var balance = (acct) => { return web3.fromWei(web3.eth.getBalance(acct), 'ether').toNumber()}

deployed.address  //check the contract address



 decypher.callContract({
 deployed: ens.ethRegistrar,
 pKeyx: pKeyx,
 methodName: "startAuction",
fromAddress: addr
 }, web3.sha3("furtherdata"))



