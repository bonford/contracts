contract HelloWorld {
    function displayMessage() constant returns (string) {
        return "Hello from a smart contract.";
    }
}


var deployed = helloWorldContract.new({
from: web3.eth.accounts[0],
data: compiled.contracts[':HelloWorld'].bytecode,
gas:4700000,
gasPrice:5,
}, (error, contract) => {})


eth_sendTransaction

  Transaction: 0xf0c461966c63d02cd33f0a216d72785bebb03dcdf65f31ccb4e417a7eb0c28d4