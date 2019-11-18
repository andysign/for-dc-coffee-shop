# Blockchain Coffee Shop

This is a simple Ethereum chain made out of two nodes. The scope of this project is to experiment a simple payment system for a virtual coffee shop.

---

## Blockchain Coffee Shop: Requirements

> **Technical Task – The Virtual Coffee Shop**

> Demonstrate functionality: <br>
> 1. Using a DLT/blockchain platform of your choice we’d like you to spin up a private test network comprising no fewer than 2 nodes. <br><br>
> 2. Create a Virtual Coffee Shop (Bob’s Coffees) which sells 3 types of coffee – Americano, Latte, and Cappuccino. Alice comes along to buy a coffee from Bob’s Coffees. She can choose a coffee, and if she pays the right amount, she receives a coffee in return. Handle simple issues like underpayment or overpayment with useful messages and giving Alice her change. <br>

---

## Blockchain Coffee Shop: Init The Test Nodes

To bootstrap and initialize a new genesis blocks for both node01 and node02 just run the init scripts:

`./init-geth01.sh`

`./init-geth02.sh`

---

## Blockchain Coffee Shop: Spin Up A Private Test Network

This network is a private test network comprising no fewer than 2 nodes.

Assuming that you have all the nodekey files in place and the static-nodes json files in place and also all the account files just run:

`./start-geth01.sh`

`./start-geth02.sh`

Note that one can clear the chain information both for node one and node just by typing `./reset-geth01.sh` and then then by typing `./reset-geth02.sh`.

---

## Blockchain Coffee Shop: Running The User Interface

One can simply run a simple http server to serve the index.html file with:

`python3 -m http.server`

![img](https://i.imgur.com/UTVUC9z.png)

the front end can be viewd by accessing:

http://localhost:8545

---

## Blockchain Coffee Shop: Points of Discussion

Points for discussion:

> * **Consider what you could do to ensure that Charlie’s Coffees, who happen to have a node on the network, can’t see how many Americanos Bob’s Coffees sell in a day?**

> * **What would you do if you wanted to allow Charlie’s Coffees to be able to pay Bob’s Coffees to reveal some of their pricing or sales information from time totime?**

First, in order to prevent Charlie from his intention see how many Americanos Bob’s Coffees sell in a day, in the coffee system design one can:

1. Encrypt the name of each item to confuse the person analyzing the chain;
2. Create notes with full backing in Fiat / Crypto where the backing val is encrypted and distribute those notes to every customer who wants Bob's coffees and possibly include zero notes;
3. Use crypho thumblers;
4. Use the Aztec Protocol or a similar ZeroKnoledgeProtocol.

Last but not least, to allow Charlie’s Coffees to be able to pay Bob’s Coffees to reveal some of their pricing or sales info one can use a system where the shop owner creates an index variable that star at zero that rep all the items he sold then with homomorphic encryption allows for the encrypted value of index to be incremented with an encrypted amount representing how many coffees someone bought in one transaction for example then sell the decryption key.

---
