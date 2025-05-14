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

Here $\fpdim$ stands for the [Frobenius-Perron dimension]({% link pages/Concepts/FrobeniusPerronDimension.md %}).

Not every fusion ring has associated $S$-matrices and the existence of an $S$-matrix for a fusion ring does not guarantee that the ring is categorifiable into a modular fusion category. If the fusion ring is categorifiable into a modular fusion category $\mathcal{C}$ then the $S$ matrix of $\mathcal{C}$ must be one of the fusion ring's up to scaling (see definition of $S$-matrix of a category below). This does not imply that all $S$-matrices of a fusion ring appear as modular data of fusion categories.

_Note: If the fusion ring is categorifiable to a ribbon category $\mathcal{C}$ that is not modular then the $S$-matrix of $\mathcal{C}$ is not one of the ones on the fusion ring page. This is because we demand that an S-matrix belonging to a fusion ring is unitary, and thus invertible._

## $S$-matrix of a braided spherical category
In the [EGNO](https://math.mit.edu/~etingof/egnobookfinal.pdf) one finds the following definition.

**Definition**
_($S$-matrix of a braided spherical category)_
Let $\mathcal{C}$ be a braided spherical category with braiding $c_{X,Y}: X \otimes Y \rightarrow Y \otimes X $ then the $\mathcal{S}$-matrix of $\mathcal{C}$ is defined as
\\[
  \mathcal{S}_{X,Y} := \tr (c_{Y,X}c_{X,Y}).
\\]

From the definition it follows that the $\mathcal{S}$-matrix is a square, symmetric matrix with $\mathcal{S}_{\mathbf{1},Y} = \fpdim (Y)$.
In contrast to the $S$-matrices of a fusion ring the $S$-matrix from $\mathcal{C}$ is not necessarily invertible. If it is invertible, it is not unitary but can be made unitary by scaling with a factor $\frac{1}{\fpdim{\mathcal{C}}} = \frac{1}{\fpdim{R}}$. Only after scaling it corresponding to one of the $S$-matrices of its fusion ring.

If the $S$-matrix of $\mathcal{C}$ is invertible, $\mathcal{C}$ is called a [**modular category**]({% link pages/Concepts/ModularCategory.md %}).

_Note: There is also a more general definition of an $S$-matrix, defined in 8.19 of the EGNO but we don't use that definition anywhere on the site at the moment._
