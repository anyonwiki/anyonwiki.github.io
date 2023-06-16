---
layout: page
title: Fusion Ring
---

# Definition
There are multiple definitions of the concept fusion ring in the literature, often with subtle differences. On the AnyonWiki the following definition is used.

**Definition**{:.label}
A **fusion ring** $$ (R,+,\cdot) $$ is a ring with unit $$\psi_1$$ for which the following axioms are fulfilled:

* The underlying abelian group $$ (R,+) $$ is a free abelian group.
* There exists a finite set $$B = \{\psi_i\}_{i \in I} \subset R$$ such that $$\psi_1\in B$$ and $$R=\mathbb{Z}B$$.
* For all $$ i,j \in I $$
  <center>
  $$
  \psi_i \times \psi_j  = \sum_{k\in I} N_{i,j}^{k}\psi_k, \quad N_{i,j}^{k} \in \mathbb{N}
  $$
  </center>
* There exists an involution $$ i  \mapsto i^* $$  such that $$ N_{i,j}^{k} = N_{i^*,k}^{j} = N_{k,j^*}^{i}$$ (Frobenius reciprocity).

Immediate consequences:

* The fact that $$ \psi_1 $$ is a unit reformulates as $$  N_{i,1}^j = N_{1,i}^j = \delta_i^j $$ for all $$ i,j \in I $$, which reformulates as $$  N_{i^*,j}^1 = N_{j,i^*}^1 = \delta_{i,j} $$ by Frobenius reciprocity.
* The associativity of the ring reformulates as: for all $$ i,j,k \in I $$
<center>
$$ \sum_{s \in I} N_{i,j}^s N_{s,k}^t = \sum_{s \in I} N_{j,k}^s N_{i,s}^t$$
</center>

# Frobenius-Perron Dimension

The involution $$ * $$ provides a $$ * $$-algebra structure on $$ \mathbb{C}B $$, given by $$ \psi_i^* =  \psi_{i^*} $$.

**Theorem**{:.label}
_(Frobenius-Perron theorem)_: there is a unique $$ * $$-homomorphism $$ d: \mathbb{C}B \to  \mathbb{C} $$, with $$ d(P) \subset \mathbb{R}_{>0} $$.

The number $$ d(\psi_i) $$ is called the **Frobenius-Perron dimension** of $$ \psi_i $$, and is noted $$ \mathrm{FPdim}(\psi_i) $$. The Frobenius-Perron dimension of $$ R $$ is the number $$  \mathrm{FPdim}(R):= \sum_i \mathrm{FPdim}(\psi_i)^2 $$.

# General Constructions of Fusion Rings
There are multiple classes of fusion rings that can be constructed according to a fixed set of rules. Here we list some of these.

## Group Rings
The group ring of any finite group $$G$$ is a fusion ring.

## $$\text{Rep}(G)$$
The irreducible representations of any finite group with the tensor product as ring product form a fusion ring.

## Quantum Double Constructions

## Fusion Rings Coming From Lie Theory

### Metaplectic Fusion Rings

## Quadratic Fusion Rings

### Songs

### Tambara-Yamagami Fusion Rings

### Haagerup-Izumi Fusion Rings
