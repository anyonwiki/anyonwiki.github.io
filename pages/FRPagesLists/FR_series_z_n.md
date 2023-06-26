---
title: $$ \mathbb{Z}_n$$
layout: default
keywords: Fusion Ring, Series
---
# $$ \mathbb{Z}_n$$

# Particle labels

The particles are labelelled $$\phi_i$$ with $$ i=0,1,2,\ldots, n-1 $$.

# Fusion Rules

$$
\begin{array}{|l|}
\hline
 \phi_i \times \phi_j = \phi_{i+j\bmod n} \\
\hline
\end{array}
$$


# Quantum Dimensions

| Particle | Numeric | Symbolic |
| :------ | :------ | :------ |
| $$ \phi_i $$ | $$ 1. $$ | $$ 1 $$ |
| $$ \mathcal{D}_{FP}^2 $$ | $$  $$ | $$ n $$ |

<!--
# Characters
-->

# Modular Data

We provide two sets of solutions for the modular data.


## Case 1

For case 1, the [ $$ S $$-matrices]({% link pages/Concepts/S-Matrix.md %}) and [ twist factors]({% link pages/Concepts/TwistFactors.md %}) depend on the parameter $$p = 0, 1, \ldots n-1$$. These theories are modular, provided that $$n$$ is odd, and $$\gcd(p,n)=1$$. Thus, the central charge is only defined under these conditions.

| $$ S $$-matrix elements | Twist factors |
| :------ | :------ |
| $$ S_{j,k} = \frac{1}{\sqrt{n}}e^{2 \pi i \frac{2p j k}{n}}  $$ | $$ \theta_j = e^{2 \pi i \frac{p j^2}{n}}$$ |

The topological central charge, which is defined modulo 8, is given by

$$
\begin{array}{l}
c_{\rm top} = 0 \quad \text{for $n=1 \bmod4 \wedge (p|n) = 1$} \\
c_{\rm top} = 2 \quad \text{for $n=3 \bmod4 \wedge (p|n) = 1$} \\
c_{\rm top} = 4 \quad \text{for $n=1 \bmod4 \wedge (p|n) = -1$} \\
c_{\rm top} = 6 \quad \text{for $n=3 \bmod4 \wedge (p|n) = -1$}
\end{array}
$$

Here, $(a\|n)$ denotes the Jacobi symbol, which arises in the study of quadratic Gauss sums, which naturally appear when calculating the central charge modulo 8.

We note that the cases with $$n$$ odd and $$p = (n-1)/2$$ correspond to $$su(n)_1$$, which has central charge $$c = n-1$$.

## Case 2

For case 2, the [ $$ S $$-matrices]({% link pages/Concepts/S-Matrix.md %}) and [ twist factors]({% link pages/Concepts/TwistFactors.md %}) again depend on $$p = 0, 1, \ldots n-1$$. These theories are modular, provided that $$\gcd(2p+1,n)=1$$, in which case the central charge is defined.

| $$ S $$-matrix elements | Twist factors |
| :------ | :------ |
| $$ S_{j,k} = \frac{1}{\sqrt{n}}e^{2 \pi i \frac{(2p+1) j k}{2n}}  $$ | $$ \theta_j = e^{2 \pi i \bigl(\frac{(2p+1) j^2}{2n} + \frac{n j}{2}\bigr)}$$ |

For $$n$$ odd, the topological central charge is given by

$$
\begin{array}{l}
c_{\rm top} = (1-n) \bmod 8 \quad \text{for $(2p+1|n) = 1$} \\
c_{\rm top} = (5-n) \bmod 8 \quad \text{for $(2p+1|n) = 1$} 
\end{array}
$$

<!--
$$
c = \begin{cases}
(1-n) \bmod 8 & \text{for $(\frac{2p+1}{n}) = 1$} \\
(5-n) \bmod 8 & \text{for $(\frac{2p+1}{n}) = -1$} \ .
\end{cases}
$$
-->


For $$n$$ even, the topological central charge is given by

$$
\begin{array}{l}
c_{\rm top} = 1 \quad \text{for $2p+1 = 1 \bmod 4 \wedge (2n|2p+1) = 1$} \\
c_{\rm top} = 3 \quad \text{for $2p+1 = 3 \bmod 4 \wedge (2n|2p+1) = -1$} \\
c_{\rm top} = 5 \quad \text{for $2p+1 = 1 \bmod 4 \wedge (2n|2p+1) = -1$} \\
c_{\rm top} = 7 \quad \text{for $2p+1 = 3 \bmod 4 \wedge (2n|2p+1) = 1$} \ .
\end{array}
$$

Again, $(a\|n)$ denotes the Jacobi symbol.

The cases with $$n$$ even and $$p = \frac{n}{2}-1$$ correspond to $$su(n)_1$$, which has central charge $$c = n-1$$.

The cases with $$n$$ even and $$p=1$$ correspond to $$u(1)_n$$ (that is, the compactified boson cft with $$n$$ primary fields), which has central charge $$c=1$$. 


NOTE: I need to check if $$n$$ is allowed to be odd in case 2 !


<!-- old stuff from a different page
# Adjoint Subring

The [ adjoint subring ]({% link pages/Concepts/AdjointBasedSubring.md %}) is the ring itself.

The [ upper central series ]({% link pages/Concepts/AdjointBasedSubring.md %}) is the following:
$$ \text{Trivial} $$

# Universal grading

This fusion ring allows only the trivial grading.

# Categorifications
This ring has 1 categorification: the trivial Fusion Category.


# Data

Download links for numeric data:

* [ Multiplication Table ]({% link data/FusionRings/FR_1_1_0_1/multtab.csv %})
* [ Quantum Dimensions ]({% link data/FusionRings/FR_1_1_0_1/qdims.csv %})
* [ Character Table ]({% link data/FusionRings/FR_1_1_0_1/chars.csv %})
* [ S-Matrix 1 ]({% link data/FusionRings/FR_1_1_0_1/smat_1.csv %}), [ Twist Factors1 ]({% link data/FusionRings/FR_1_1_0_1/twistfactors_1.csv %})
-->