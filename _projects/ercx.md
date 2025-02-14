---
layout: page
title: ERCx
description: Property testing for ERC tokens.
img: assets/img/ercx.png
importance: 1
category: work
related_publications: true
---

ERCx checks the conformance of a contract to [ERC (Ethereum Request for Comments)](https://eips.ethereum.org/erc) standards and additional desirable security properties. ERC standards exist for various sorts of tokens, fungible or not. ERC standards specify essential aspects of a contract (management of transfers, delegation, etc.). Contract developers should strive to follow the guidelines of ERC standards as they provide a reference frame during development.

To check a given contract, ERCx uses property tests: for the contract under test, we generate a tailored test suite, which is a collection of test cases. ERCx also relies on the [Foundry](https://github.com/foundry-rs) testing framework, a reliable and easy-to-setup tool that is widely used by developers and auditors.


In collaboration with [Certora](https://www.certora.com/), we published a paper on our process to ensure the highest quality possible for the test suite.
{% cite conf/icst/NicourtKNF24 %}

[Link to the website](https://ercx.runtimeverification.com).
