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

---
