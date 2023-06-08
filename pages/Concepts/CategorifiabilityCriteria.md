---
layout: page
title: Categorifiability Criteria
---

The following criteria are listed in https://link.springer.com/content/pdf/10.1007/s11005-022-01542-1.pdf. 



# Criteria for Pivotal Categorification

## Pivotal Version of Drinfeld Center Criterion

Let $$R$$ be a commutative fusion ring of basis $$\left(b_i\right)$$. Let $$\left(X_i\right)$$ be the corresponding fusion matrices. Let $$A$$ be $$\sum_i X_i X_i^*$$, and $$\left(c_j\right)$$ its eigenvalues. The fusion matrices commute over each other and are normal (because $$X_i^*=X_{i^*}$$ ), so are simultaneously diagonalizable, say as $$\left(\lambda_{i, j}\right)$$, called the character table of $$R$$. Then $$c_j=\sum_i\left|\lambda_{i, j}\right|^2$$.

**Theorem**{:.label #PVDCC}
 _(Pivotal version of Drinfeld center criterion)_ 
If $$R$$ admits a complex pivotal categorification $$\mathcal{C}$$, then there exists $$j$$ such that for all $$i, c_j / c_i$$ is an algebraic integer.
{:.theorem}

# Criteria for Unitary Categorification

## Schur Product Criterion

Let $$R$$ be a commutative fusion ring. Let $$\Lambda=\left(\lambda_{i, j}\right)$$ be the table coming from the simultaneous diagonalization of its fusion matrices, with $$\lambda_{i, 1}=\max _j\left(\left|\lambda_{i, j}\right|\right)$$. 
The commutative Schur product criterion [(corollary 8.5)](https://www.sciencedirect.com/science/article/pii/S0001870821003443) is the following:
**Theorem**{:.label #CSPC}
  _(commutative Schur product criterion)_
If $$R$$ admits a unitary categorification, then for all triples $$\left(j_1, j_2, j_3\right)$$ we have

$$
\sum_i \frac{\lambda_{i, j_1} \lambda_{i, j_2} \lambda_{i, j_3}}{\lambda_{i, 1}} \geq 0
$$

{:.theorem}

Note that [Theorem](#CSPC) is the corollary of a (less tractable) noncommutative version [(Proposition 8.3)](https://www.sciencedirect.com/science/article/pii/S0001870821003443) which states

**Theorem**{:.label #NCSPC} (Non-commutative Schur product criterion). A fusion ring $$R$$  with basis $$\left\{x_1=1, \ldots, x_r\right\}$$ is unitarily categorifiable if and only if for all triples of irreducible unital $$*$$-representations $$\left(\pi_s, V_s\right)_{s=1,2,3}$$ of the fusion ring/algebra $$R$$ over $$\mathbb{C}$$, and for all $$v_s \in V_s$$, we have
$$
\sum_i \frac{1}{d\left(x_i\right)} \prod_{s=1}^3\left(v_s^* \pi_s\left(x_i\right) v_s\right) \geq 0
$$
{:.theorem}


# References
