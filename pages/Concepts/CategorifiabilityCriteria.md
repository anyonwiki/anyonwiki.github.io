---
layout: page
title: Categorifiability Criteria
---

In the criteria on this page we use the following notation:

* $$R$$: a fusion ring with basis $$\left(b_i\right)$$ and structure constants $$N_{ij}^k$$
* $$X_i$$: the fusion matrices, i.e. $$[X_i]^k_j = N_{ij}^k$$
* $$A := \sum_i X_i X_i^* $$ (with $$X_i^* := X_{i^*} $$), and with eigenvalues $$(c_j)$$. These are also called the formal codegrees of a fusion ring.
* $$\lambda$$: the matrix that simultaneously diagonalizes all $$X_i$$ (if it exists), i.e. $$[\lambda]^i_j$$ are the characters of $$R$$.


## Criteria for General Categorification
{:.label}


## Criteria for Complex Categorification
{:.label}

### d-number criterion
{:.label}

**Definition**
_($$d$$-number)_ An algebraic integer $$\alpha$$ is called a $$d$$-number if its minimal polynomial $$p(x) = x^n + a_1x^n-1+\cdots+a_n$$ (where $$a_i \in \mathbb{Z}$$) satsifies that $$(a_n)^i$$ divides $$(a_i)^n$$ for all $$i$$.

___

**Theorem**
_($$d$$-number criterion)_
Let $$R$$ be commutative. If $$R$$ admits a complex fusion category, then the formal codegrees $$(c_j)$$ of $$R$$ are $$d$$-numbers.

___

### Extended Cyclotomic Criterion
{:.label}

___

**Theorem**{:.label #ECC}
_(Extended Cyclotomic Criterion)_
Let $$R$$ be commutative. If there is a fusion matrix such that the splitting field of its minimal polynomial is a non-abelian extension of $$\mathbb{Q}$$ then $$R$$ admits no complex categorification.

___



## Criteria for Pivotal Categorification
{:.label}

### Pivotal Version of Drinfeld Center Criterion
{:.label}


___

**Theorem**{:.label #PVDCC}
 _(Pivotal version of Drinfeld center criterion)_
Let $$R$$ be commutative. If $$R$$ admits a complex pivotal categorification, then there exists $$j$$ such that for all $$i, c_j / c_i$$ is an algebraic integer.

___

## Criteria for Unitary Categorification
{:.label}

### Schur Product Criterion
{:.label}

The commutative Schur product criterion [(corollary 8.5)](https://www.sciencedirect.com/science/article/pii/S0001870821003443) is the following:

___

**Theorem**{:.label #CSPC}
 _(commutative Schur product criterion)_
Let $$R$$ be commutative with $$[\lambda]^i_1=\max _j\left(\left|\lambda_{i, j}\right|\right)$$.
If $$R$$ admits a unitary categorification, then for all triples $$\left(j_1, j_2, j_3\right)$$ we have

$$
\sum_i \frac{ [\lambda]^i_{j_1} [\lambda]^i_{j_2} [\lambda]^i_{j_3} }{[\lambda]^i_1} \geq 0
$$

___


Note that [Theorem](#CSPC) is the corollary of a (less tractable) noncommutative version [(Proposition 8.3)](https://www.sciencedirect.com/science/article/pii/S0001870821003443) which states

___

**Theorem**{:.label #NCSPC}
 _(Non-commutative Schur product criterion)_  A (possibly non-commutative) fusion ring $$R$$ is unitarily categorifiable if and only if for all triples of irreducible unital $$*$$-representations $$\left(\pi_s, V_s\right)_{s=1,2,3}$$ of $$R$$ over $$\mathbb{C}$$, and for all $$v_s \in V_s$$, we have

$$
\sum_i \frac{1}{d\left(x_i\right)} \prod_{s=1}^3\left(v_s^* \pi_s\left(b_i\right) v_s\right) \geq 0
$$

___

# References

Many of these cirteria are listed in [Classification of Grothendieck rings of complex fusion categories of multiplicity one up to rank six](https://link.springer.com/content/pdf/10.1007/s11005-022-01542-1.pdf)
