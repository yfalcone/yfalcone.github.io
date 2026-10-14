---
layout: page
title: DecentMon
description: An OCaml Benchmark for Decentralized Monitoring
img: assets/img/decentmon.png
importance: 2
category: work
related_publications: true
---

DecentMon is an OCaml Benchmark for Decentralized Monitoring of LTL formulae.
DecentMon is written in the functional programming language OCaml.

![DecentMon inputs and outputs](../assets/img/decentmon.png)

DecentMon takes as input:

- some LTL formulae to be monitored or some LTL Specification patterns (see the Specification Patterns Website);
- some traces against which the formulae are monitored;
- an architecture given by a distributed alphabet indicating how components are organised and distributed in the system.

The iterations of DecentMon served to produce experimental results for several publications:
{% cite conf/fm/BauerF12 %}
{% cite journals/fmsd/0002F16 %}
{% cite conf/rv/ColomboF14 %}
{% cite journals/fmsd/ColomboF16 %}
{% cite conf/forte/ViscontiBFN24 %}

[Link to the repo](https://gricad-gitlab.univ-grenoble-alpes.fr/falconey/decentmon).
