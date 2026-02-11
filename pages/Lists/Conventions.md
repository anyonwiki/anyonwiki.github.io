---
layout: page
title: Conventions Used on the AnyonWiki
---
This page collects some of the (pages on) conventions that will be used on the wiki. Its aim is on the one hand to settle conventions and on the other to clarify the meaning of some commonly used symbols and expressions.

# Pages explaining conventions
These might later be (partially) imported in this page.

* [Indexing of Roots of Polynomials]({% link pages/Concepts/RootObjects.md %})
* [$S$-matrix]({% link pages/Concepts/S-Matrix.md %})

# Naming conventions 

## Naming of fusion rings 
For the naming scheme behind fusion rings, see [this paper](https://pubs.aip.org/aip/jmp/article/64/9/091703/2912575/On-low-rank-fusion-rings), Appendix B.

## Naming of fusion categories
To be able to refer to multiplicity-free fusion categories, the following naming scheme is used. 
There are two naming conventions for a fusion category. 
* $$[\mathrm{RingName}]_{i,j,k}$$ where RingName is the name of its fusion ring, and $i, j, k$ are natural numbers that distinguish between the solutions to the pentagon, hexagon, and pivotal equations, respectively. If there are no solutions to the hexagon equations, then j = 0. For example, $$[\mathrm{Rep}(D_3)]_{1,2,1}$$ is the fusion category with fusion ring $\mathrm{Rep}(D_3)$, corresponding to the first solution to the pentagon equations, the second solution to the hexagon equations, and the first solution to the pivotal equations.
* $$\mathrm{FC}^{a,b,c}_{d,i,j,k}$$ where $a,b,c,d$ denote fusion ring indices and $i,j,k$ denote the indices that distinguish between the solutions to the pentagon, hexagon, and pivotal equations, respectively. For example, $\mathrm{FC}^{3,1,0}_{1,2,2,1}$ has fusion ring $\mathrm{FR}^{3,1,0}_1$ and it is the second solution to the pentagon equations, the second solution to the hexagon equations, and the first solution to the pivotal equations. 

This scheme only makes sense if the ordering of the solutions to the consistency equations can be standardized in some way. We propose a standardized ordering of solutions to the pentagon equations, based on the list of data $(b_B , b_U , b_S , b_R , n_M , w_F )$, where
* $b_B, b_U, b_S, b_R$ are 1 if the fusion system can be expanded to respectively a braided, unitary, spherical, ribbon fusion system, and 0 otherwise.
* $n_M$ equals the number of modular fusion categories corresponding to the solution to the pentagon equations.
* $w_F$ is a weight function that calculates the list of values of the orbit $S(I)$. Here $I$ is the set of gauge-invariant rational monomials obtained from a specific gauge-split basis (see definition 4.2 in this [paper](https://arxiv.org/abs/2601.20012)), the tuples in $S(I)$ are sorted numerically and every number $re^{i\phi}$, $\phi \in [0, 2π[$ is rewritten as a couple $(−r, −\phi)$.

The values of these lists then sort the solutions in decreasing lexicographic order. In particular, the solutions that admit braiding have a lower $i$ index than those that do not. Within these classes, the unitary solutions have a lower $i$ index than the non-unitary
ones, and so on.

While the weight function $w_F$ is invariant under gauge-transforms and fusion ring automorphisms, it does depend on the specific form of the gauge split basis $I$. The form of this basis depends on 
1. the order of the elements of the fusion ring, and
2. the specific algorithm used to construct the kernel of a matrix

For 1. we decided to use the canonical ordering introduced in [this paper](https://pubs.aip.org/aip/jmp/article/64/9/091703/2912575/On-low-rank-fusion-rings), Appendix B. For 2, a low-level Mathematica algorithm was written to construct the kernel of a matrix. The file used to sort and group the categories into 3 levels, determining the indices $i,j,k$ can be found [here](https://github.com/gert-vercleyen/Anyonica/blob/develop/NamingCategories.wl).  The algorithm is not optimized for speed since we wanted it to be easy to implement in
other programming languages as well. 

_Remark. At the moment, this naming scheme only works for multiplicity-free fusion systems. For systems with multiplicity, it is much harder to set up a list of gauge invariants that completely fix the fusion category._
