---
title: $$ so(2p+1)_2$$
layout: default
keywords: Fusion Ring, Series, Affine Lie Algebra, Special Orthogonal
---
# $$ so(2p+1)_2 $$

These fusion rings are called metaplectic fusion rings. We assume that $p\geq 1$.

# Particle labels

The fusion ring has the following basis
\\[
  ( \mathbf{1}, \epsilon, \psi_+, \psi_-, \phi_0, \ldots, \phi_{p-1}),
\\]
of $p + 4$ elements. The particles have the following quantum dimensions

| Particle | $\fpdim$ |
|:=========|:=========|
|$\mathbf{1}$| $1$ |
|$\epsilon    $| $1$ |
|$\psi_\pm  $| $\sqrt{2p+1}$|
|$\phi_i    $| $2$ |

Thus we have $\mathcal{D}_{FP}^2 = 4(2p+1)$.

# Fusion Rules

The fusion rules read as follows.

* The action of $\epsilon$ is

$$
\begin{array}{l}
\epsilon \times \epsilon = \mathbf{1} \\
\epsilon \times \psi_\pm =\psi_\mp \\
\epsilon \times \phi_i = \phi_i
\end{array}
$$

* The action of $\psi_\pm$ is

$$
\begin{array}{l}
\psi_\pm \times \psi_\pm = \mathbf{1} + \sum_i \phi_i 
\\
\psi_\pm \times \psi_\mp = \epsilon + \sum_i \phi_i
\\
\psi_\pm \times \phi_i = \psi_\pm + \psi_\mp
\end{array}
$$

* Finally, the $\phi_i$ fuse amongst themselves as

$$
\begin{array}{l}
\phi_i \times \phi_i =
\begin{cases}
\mathbf{1} + \epsilon + \phi_{2i+1} & \text{if $2i \leq p-2$}\\
\mathbf{1} + \epsilon + \phi_{2p-2-2i} & \text{if $2i > p-2$}\\
\end{cases} \\
\phi_i \times \phi_{j\neq i} =
\begin{cases}
\phi_{|i-j|-1} +  \phi_{i+j+1} & \text{if $i+j \leq p-2$}\\
\phi_{|i-j|-1} +  \phi_{2p-i-j-2} & \text{if $i+j > p-2$}
\end{cases}
\end{array}
$$


# Modular Data

The solutions of the pentagon equations are labelled by the tuple
$(p,r,\kappa)$, where $r$ is an odd integer $1\leq r < 2p+1$ such that
$\gcd(r,2p+1)=1$ and $\kappa = \pm 1$. For each solution, there are two
spherical structures; for one of them, all quantum dimensions are positive.
Below, we only consider those cases.

The solutions of the hexagon equations are labelled by the tuple
$(p,r,\kappa,\lambda)$, where $\lambda = \pm 1$. Swapping
$\lambda = +1 \leftrightarrow \lambda = -1$ merely inverts the $R$-symbols.

## $S$-matrix

To specify the modular $S$-matrix, we state the elements of
$\check{S} = 2\sqrt{2p+1} S$.

$$
\begin{array}{llll}
\check{S}_{\mathbf{1},\mathbf{1}} = 1 \\
\check{S}_{\mathbf{1},\epsilon} = 1 & \check{S}_{\epsilon,\epsilon} = 1\\
\check{S}_{\mathbf{1},\psi_\pm} = \sqrt{2p+1} & \check{S}_{\epsilon,\psi_\pm} = -\sqrt{2p+1} & \check{S}_{\psi_\pm,\psi_\pm} = -\kappa \sqrt{2p+1} (2|2p+1) \\
& & \check{S}_{\psi_\pm,\psi_\mp} = \kappa \sqrt{2p+1} (2|2p+1)\\
\check{S}_{\mathbf{1},\phi_i} = 2 & \check{S}_{\epsilon,\phi_i} = 2 & \check{S}_{\psi_\pm,\phi_i} = 0 & \check{S}_{\phi_i,\phi_j} = 4 \cos\bigl(\frac{2 \pi (i+1)(j+1)r}{2p+1}\bigr)
\end{array}
$$

Here, $(2\|2p+1)$ denotes the Jacobi symbol.

## Twist factors

The twist factors are given by

$$
\begin{array}{l}
\theta_{\mathbf{1}} = 1 \\
\theta_{\epsilon} = 1 \\
\theta_{\psi_\pm} = \mp (-1)^{\frac{\kappa \lambda r}{2}} e^{\frac{i \pi \lambda r}{4}( (2p+1|r) + \kappa(2|2p+1) -p)} \\
\theta_{\phi_j} = (-1)^{j+1} e^{i \pi \frac{\lambda r (j+1)^2}{2p+1}}
\end{array}
$$

## Central charge

The topological central charge is given by
$c = 2p(\lambda+2p)−2+2(r|2p+1) \bmod 8$.

## $so(2p+1)_2$ CFT

The $so(2p+1)_2$ CFTs correspond to the following values, $r=1$,
$\kappa = (2p+1\|2) = (-1)^{p(p+1)/2}$ and $\lambda = -1$.

# References

* [Classification of Metaplectic Fusion Categories](https://arxiv.org/abs/1608.03762v2)
* [Classification of Metaplectic Modular Categories](https://arxiv.org/abs/1601.05460v1)
* [alatc package](https://github.com/ardonne/affine-lie-algebra-tensor-category)
