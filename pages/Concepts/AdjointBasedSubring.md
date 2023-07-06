---
layout: default
title: Adjoint Based Subring
---

# Adjoint Based Subring
From the [EGNO](https://math.mit.edu/~etingof/egnobookfinal.pdf)

**Definition**
The adjoint subring $R_{\text{ad}}$ of a fusion ring $R$ is the minimal sub fusion ring of $R$ with the property that $b_i \conj{b_i}$ belongs to $R_\text{ad}$ for all basis elements $b_i$ of $R$.

# Universal Grading
<!-- **Proposition**
Any one-sided (i.e., left or right) $R_{\text{ad}}$-submodule $M \subset R$ of a fusion ring R is automatically an $R_{\text{ad}}$-sub-bimodule. -->
Here we show how any fusion ring $R$ has a universal grading.

Let $R$ be a fusion ring. We can view $R$ as a $\bbz_+$-bimodule over $R_{\text{ad}}$. As such, it decomposes into a direct sum of indecomposable based $R_{\text{ad}}$-bimodules: $R = \bigoplus_{a \in G} R_a$, where $G$ is the index set. This decomposition is unique up to a permutation of $G$. We may assume that there is an element $\mathbf{1} \in G$ such that $R_\mathbf{1} = R_{\text{ad}}$. Note that $$ \conj{(R_a)} = \{ \conj{X} | X ∈ R_a \}, a ∈ G $$,
is an indecomposable $R_{\text{ad}}$-submodule of $R$ and hence $\conj{(R_a)} = R_\conj{a}$ for some $\conj{a} ∈ G$.

**Theorem** There is a canonical group structure on the index set G with the multiplication defined by the following property:
\[
  ab=c \Leftrightarrow x_a x_b ∈ R_c, \forall x_a ∈ R_a,x_b ∈R_b, a,b,c ∈ G.
\]
The identity of $G$ is $1$ and the inverse of $a∈G$ is $\conj{a}$.

Every fusion ring $R$ has a canonical faithful grading by a group $G =: U(R)$. It is such that any other faithful grading of $R$ by a group $G$ is determined by a surjective group homomorphism $π : U(R) → G$.


# Upper Central Series
