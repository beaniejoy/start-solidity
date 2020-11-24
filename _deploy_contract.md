# Deploy Contract in the Ethereum Platform

how to deploy Contract I made in the Ethereum Blockchain platform

<br>

## 1. Construct Dev Environment

### Package Installation

```cmd
$ npm install ganache-cli solc web3
```

### run ganache server
```cmd
$ node_modules/.bin/ganache-cli
```
10 accounts are given, and each account has 100 ether.

<br>

## 2. Make Contract Code

[`Voting2.sol`](https://github.com/hanbinleejoy/start-solidity/blob/main/src/Voting2.sol) Contract code is gonna be deployed.

<br>

## 3. Compile the Solidity Contract

by using `solcjs` module, we can build solidity code  
make two files, abi & binary files.

```cmd
$ node_modules/.bin/solcjs --bin --abi Voting.sol

$ ls
node_modules  package-lock.json  Voting.sol  Voting_sol_Voting.abi Voting_sol_Voting.bin
```
- `Voting_sol_Voting.abi`  
  it provides with the information of contract with json format
- `Voting_sol_Voting.bin`  
  it can be deployed in the ethereum platform

<br>

## 4. Deploy

convert to node command
```cmd
$ node
```
```js
> Web3 = require('web3')
// make web3 object and connect ganache server
> web3 = new Web3('http://localhost:8545')
```
connect with ganache server

```js
// read bytecode file and convert to string 
> bytecode = fs.readFileSync('./Voting2_sol_Voting2.bin').toString()
// read abi json file and convert to json object
> abi = JSON.parse(fs.readFileSync('./Voting2_sol_Voting2.abi').toString())
```

```js
// making Contract object
> deployedContract = new web3.eth.Contract(abi)
```
`web3.eth.Contract`: make it easy to interact with smart contracts on the ethereum blockchain

```js
> deployedContract.deploy({
  data: bytecode,
  arguments: [['Joy', 'Beanie','Luv'].map(name => web3.utils.asciiToHex(name))]
}).send({
  from: 'address_of_account',
  gas: 1500000,
  gasPrice: web3.utils.toWei('0.00003', 'ether')
}).then((newContractInstance) => {
  deployedContract.options.address = newContractInstance.options.address;
})
```
- `deployedContract.options.address`  
  after successful deployment, the new contract will be made.

```cmd
eth_sendTransaction

  Transaction: 0x5f7732f5597cf265a3086dea042462a4e7cbffab31b6102342613ef03dee92d8
  Contract created: 0xc55668042cd85934bb8d8bdfe529d2717cb0059b
  Gas usage: 571899
  Block Number: 1
  Block Time: Fri Nov 20 2020 22:00:29 GMT+0900 (Korean Standard Time)
```
occur new log in ganache server about publishing new Contract

<br>

## Interact with Contract

```js
> deployedContract.methods
```
check all the methods of the deployed Contract.

```js
> deployedContract.methods.voteForCandidate('Joy').send({from: 'address of sender'}).then((f) => console.log(f))
```
Vote for the candidate Joy

```js
> deployedContract.methods.totalVotesFor('Joy').call().then((count) => console.log(count))
```
check the increased number of votes


