---
layout: default
title: Formal Fusion Ring Names
---

# Convention for fusion ring names
To classify fusion rings it is essential that there exists a naming scheme that covers all fusion rings and assigns a unique name to each ring. This page describes the convention that is used on this wiki.

## Naming scheme for multiplicity-free fusion rings
Multiplicity-free fusion rings are denoted by $$\text{FR}_i^{r,n}$$ where
* $$ r $$ denotes the rank of the fusion ring (which equals the number of elements including the vacuum).
* $$ n $$ denotes the number of elements that are not self-dual, i.e. not their own antiparticle. Mathematically these are the elements whose square does not contain the identity.
* $$ i $$ denotes the position of the ring in the list of multiplicity-free fusion rings of rank $$r$$ with $$n$$ non self-dual elements. The position of a ring in this list is determined by the canonical order described below.


## Canonical order of multiplicity-free fusion rings

Given a rank $$r$$ and $$n$$ non self-dual elements the multiplicity-free fusion rings are ordered on amount of non-zero structure constants and, if there is still ambiguity, according to the following scheme:
1. First the elements of the rings themselves are sorted. All self-dual elements are grouped together and the non-self-dual elements are grouped in dual pairs. The self-dual elements appear before the pairs and are sorted by increasing quantum dimension. The pairs are sorted on increasing maximum quantum dimension and within the pairs the elements are sorted on quantum dimension.
2. Let $$N_{a,b}^c$$ denote the structure constants of a multiplication table of a fusion ring. For each permutation of the elements of the ring (where the identity is kept fixed, and the previous ordering is kept fixed) a list of digits can be created by ordering the structure constants $$N_{a,b}^c$$ lexicographically on $$a,b,c$$ and expressing them in a number base which is higher than the rank of the ring: $$N_{1,1}^1,N_{1,1}^2,\ldots,N_{1,2}^1,N_{1,2}^2,\ldots,N_{r,r}^r$$.
3. By regarding each of these lists as a number with digits given by the list elements, a unique number is assigned to each permutation of the same ring. Moreover these numbers are unique for each different fusion ring.
4. Taking the maximum value of the numbers generated per ring, a unique number is then assigned to each fusion ring.
5. Using these numbers, the lists of multiplicity-free fusion rings of rank $$r$$ with $$n$$ non self-dual elements can be ordered in a canonical way.


Note that
* a single notation for any fusion ring is then obtained by setting $$\text{FR}_i^{r,1,n} \equiv \text{FR}_i^{r,n} $$.
* the ordering as described above is chosen with eye on computational efficiency, rather than simplicity. Most rings can already be ordered by looking at the rank and amount of non-self-dual elements

## Example
Consider for example the ring $$ \text{SU}(2)_3 $$ with multiplication table

$$
\begin{array}{|llll|}
	\hline
	\mathbf 1 & \mathbf 2 & \mathbf 3 & \mathbf 4 \\[4pt]
	\mathbf 2 & \mathbf 1 & \mathbf 4 & \mathbf 3 \\[4pt]
	\mathbf 3 & \mathbf 4 & \mathbf 1 + \mathbf 4 & \mathbf 2 + \mathbf 3 \\[4pt]
	\mathbf 4 & \mathbf 3 & \mathbf 2 + \mathbf 3 & \mathbf 1 + \mathbf 4 \\[4pt]
	\hline
\end{array}
$$

and quantum dimensions

$$ \left\{ 1, 1, \frac{1}{2}+\frac{\sqrt{5}}{2}, \frac{1}{2}+\frac{\sqrt{5}}{2} \right\} $$

If we sort the elements according to (1.) then we obtain either
$$( \mathbf 1, \mathbf 2, \mathbf 3, \mathbf 4 ) $$ or $$( \mathbf 1, \mathbf 2, \mathbf 4, \mathbf 3 ) $$. The digits obtained from the lists of structure constants are the following:

$$ d_1 = 1000010000100001010010000001001000100001100101100001001001101001 $$

and

$$ d_2 = 1000010000100001010010000001001000100001101001010001001001011010 $$

of which $$ d_2 $$ is the largest one and thus labels the fusion ring.

# Naming scheme for rings with multiplicity
Fusion rings with multiplicity are denoted by $$\text{FR}_i^{r,m,n}$$ where
* $$ r $$ denotes the rank of the fusion ring.
* $$ m $$ equals the multiplicity of the fusion ring, i.e. the largest structure constant.
* $$ n $$ denotes the amount of elements that are not self-dual.
* $$ i $$ denotes the position of the ring in the list of fusion rings of rank $$r$$, multiplicity $$m$$, and $$n$$ non self-dual elements. The position of a ring in this list is determined by the canonical order described below.

## Canonical order of fusion rings with multiplicity
The ordering of fusion rings with multiplicity is analogous to the ordering of multiplicity free fusion rings except that now we first also take the multiplicity $$m$$ into account before sorting the (then finite) lists of fusion rings.
