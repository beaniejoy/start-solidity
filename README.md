# start-solidity

Let's get started with developing DApp (Ethereum - solidity)

<br>

- web3
- truffle
- ganache
- solc

## Web3

> web3.js is a collection of libraries that allow you to interact with a local or remote ethereum node using HTTP, IPC or WebSocket.
- [`web3 (v1.3.0) doc`](https://web3js.readthedocs.io/en/v1.3.0/index.html#)

```js
Web3 = require('web3');
// ganache server: localhost:8545
web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
// or
var web3 = new Web3('http://localhost:8545');
```
making `web3` Object

### getAccounts

> Returns: `Promise` returns `Array` - An array of addresses controlled by node.
> 
```js
web3.eth.getAccounts().then(console.log); // not web3.eth.accounts
```
- Ganache에서 만든 10개의 accounts에 대한 주소를 보여준다.
- ["web3.eth.accounts" not supported? #246](https://github.com/trufflesuite/ganache-cli/issues/246)

### getBalance

> Get the balance of an address at a given block.

```js
web3.eth.getBalance('address of an account').then(console.log);
```

### fromWei

> Converts any wei value into a ether value.  
> ether 단위 계산

```js
// previous version > web3.fromWei()
web3.utils.fromWei(number [, unit])
```
- `number`: `string` in wei(wei 단위로)

<br>

## Ganache

> Ganache is a personal blockchain for rapid Ethereum and Corda distributed application development. (trufflesuite)

```cmd
$ npm install ganache-cli
$ node_modules/.bin/ganache-cli
```
- [Github ganache-cli](https://github.com/trufflesuite/ganache-cli)

## How to deploy contract?

[Deploy the Solidity Contract](https://github.com/hanbinleejoy/start-solidity/Voting2.sol)

<br>

## Reference

- [DApp University - Ethereum(solidity) Base](https://www.dappuniversity.com/)
