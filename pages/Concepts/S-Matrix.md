---
title: $S$-Matrix
layout: default
---

# $S$-Matrix

## $S$-matrix of a fusion ring
On the pages of fusion rings we use the following definition for the $S$-matrix.

**Definition**
_($S$-matrix of a fusion ring)_
An $S$-matrix associated to a fusion ring $R$ is a square, symmetric, unitary matrix that diagonalises the set of matrices $[N_i]_{i=1}^r$, and satisfies

  * $ \left[ S^2\right]^i_j =  N_{ij}^1 $,  
  * $ \left[ S \right]^1_i  =  \frac{\fpdim(N_i)}{\sqrt{\fpdim(R)}},\quad i = 1,\ldots,r $.

Here $\fpdim$ stands for the [quantum dimension]({% link pages/Concepts/FrobeniusPerronDimension.md %}).

Not every fusion ring has an associated $S$-matrix and the existence of an $S$-matrix for a fusion ring does not guarantee that the ring is categorifiable into a modular fusion category. In constrast to the $S$-matrix of a category a fusion ring can have multiple $S$-matrices.

## $S$-matrix of a braided spherical category
In the [EGNO](https://math.mit.edu/~etingof/egnobookfinal.pdf) one finds the following definition.

**Definition**
_($S$-matrix of a braided spherical category)_
Let $\mathcal{C}$ be a braided spherical category with braiding $c_{X,Y}: X \otimes Y \rightarrow Y \otimes X $ then the $\mathcal{S}$-matrix of $\mathcal{C}$ is defined as
\\[
  \mathcal{S}_{X,Y} := \tr (c_{Y,X}c_{X,Y}).
\\]

From the definition it follows that the $\mathcal{S}$-matrix is a square, symmetric matrix with $\mathcal{S}_{\mathbf{1},Y} = \fpdim (Y)$. The definition from the EGNO and the one used on this site differs in a factor $\frac{1}{\fpdim{\mathcal{C}}} = \frac{1}{\fpdim{R}}$ which we have added to make the matrix unitary.

In contrast to the definition for an $S$-matrix of a fusion ring above the $S$-matrix of a category need not be invertible. If it is then the category $\mathcal{C}$ is called a [**modular category**]({% link pages/Concepts/ModularCategory.md %}).

_Note: There is also a more general definition of an $S$-matrix, defined in 8.19 of the EGNO_
