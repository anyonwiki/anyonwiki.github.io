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
  ( \mathbf{1}, \Theta, \sigma, \tau, \phi_0, \ldots, \phi_{p-1}),
\\]
of $p + 4$ elements. The particles have the following quantum dimensions

| Particle | $\fpdim$ |
|:=========|:=========|
|$\mathbf{1}$| $1$ |
|$\Theta    $| $1$ |
|$\sigma  $| $\sqrt{2p+1}$|
|$\tau    $| $\sqrt{2p+1}$|
|$\phi_i    $| $2$ |


# Fusion Rules

The fusion rules read as follows.

* The action of $\Theta$ is

$$
\begin{array}{l}
\Theta \times \Theta = \mathbf{1} \\
\Theta \times \sigma =\tau \\
\Theta \times \tau = \sigma \\
\Theta \times \phi_i = \phi_i
\end{array}
$$

* The action of $\sigma$ and $\tau$ is

$$
\begin{array}{l}
\sigma \times \sigma = \tau \times \tau = \mathbf{1} + \sum_i \phi_i 
\\
\sigma \times \tau = \Theta + \sum_i \phi_i
\\
\sigma \times \phi_i = \tau \times \phi_i = \sigma + \tau
\end{array}
$$

* Finally, the $\phi_i$ fuse amongst themselves as

$$
\begin{array}{l}
\phi_i \times \phi_i =
\begin{cases}
\mathbf{1} + \Theta + \phi_{2i+1} & \text{if $2i \leq p-2$}\\
\mathbf{1} + \Theta + \phi_{2p-2-2i} & \text{if $2i > p-2$}\\
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

The modular $S$-matrix has the following elements.

$$
\begin{array}{l}
S_{\mathbf{1},\mathbf{1}} = 1 \\
S_{\mathbf{1},\Theta} = 1 \\
S_{\mathbf{1},\sigma} = \sqrt{2p+1} \\
S_{\mathbf{1},\tau} = \sqrt{2p+1} \\
S_{\mathbf{1},\phi_i} = 2 
\end{array}
$$

# References

* [Classification of Metaplectic Fusion Categories](https://arxiv.org/abs/1608.03762v2)
* [Classification of Metaplectic Modular Categories](https://arxiv.org/abs/1601.05460v1)
* [alatc package](https://github.com/ardonne/affine-lie-algebra-tensor-category)
