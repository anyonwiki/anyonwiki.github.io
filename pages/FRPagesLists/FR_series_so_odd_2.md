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
  ( \mathbf{1}, \epsilon, \psi_+, \psi_-, \phi_1, \ldots, \phi_{p}),
\\]
of $p + 4$ elements. The particles have the following quantum dimensions

| Particle | $\fpdim$ |
|:=========|:=========|
|$\mathbf{1}$| $1$ |
|$\epsilon    $| $1$ |
|$\psi_\pm  $| $\sqrt{2p+1}$|
|$\phi_j    $| $2$ |

Thus we have $\mathcal{D}_{FP}^2 = 4(2p+1)$.

# Fusion Rules

The fusion rules read as follows.

* The action of $\epsilon$ is

$$
\begin{array}{l}
\epsilon \times \epsilon = \mathbf{1} \\
\epsilon \times \psi_\pm =\psi_\mp \\
\epsilon \times \phi_j = \phi_j
\end{array}
$$

* The action of $\psi_\pm$ is

$$
\begin{array}{l}
\psi_\pm \times \psi_\pm = \mathbf{1} + \sum_j \phi_j 
\\
\psi_\pm \times \psi_\mp = \epsilon + \sum_j \phi_j
\\
\psi_\pm \times \phi_j = \psi_+ + \psi_-
\end{array}
$$

* Finally, the $\phi_i$ fuse amongst themselves as

$$
\begin{array}{l}
\phi_j \times \phi_j =
\begin{cases}
\mathbf{1} + \epsilon + \phi_{2j} & \text{if $2j \leq p$}\\
\mathbf{1} + \epsilon + \phi_{2p-2j} & \text{if $2j > p$}\\
\end{cases} \\
\phi_j \times \phi_{k \neq j} =
\begin{cases}
\phi_{|j-k|} +  \phi_{j+k} & \text{if $j+k \leq p$}\\
\phi_{|j-k|} +  \phi_{2p-j-k} & \text{if $j+k > p$}
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
$\tilde{S} = 2\sqrt{2p+1} S$.

$$
\begin{array}{llll}
\tilde{S}_{\mathbf{1},\mathbf{1}} = 1 \\
\tilde{S}_{\mathbf{1},\epsilon} = 1 & \tilde{S}_{\epsilon,\epsilon} = 1\\
\tilde{S}_{\mathbf{1},\psi_\pm} = \sqrt{2p+1} & \tilde{S}_{\epsilon,\psi_\pm} = -\sqrt{2p+1} & \tilde{S}_{\psi_\pm,\psi_\pm} = -\kappa \sqrt{2p+1} (2|2p+1) \\
& & \tilde{S}_{\psi_\pm,\psi_\mp} = \kappa \sqrt{2p+1} (2|2p+1)\\
\tilde{S}_{\mathbf{1},\phi_j} = 2 & \tilde{S}_{\epsilon,\phi_j} = 2 & \tilde{S}_{\psi_\pm,\phi_j} = 0 & \tilde{S}_{\phi_j,\phi_k} = 4 \cos\bigl(\frac{2 \pi jkr}{2p+1}\bigr)
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
\theta_{\phi_j} = (-1)^{j} e^{i \pi \frac{\lambda r j^2}{2p+1}}
\end{array}
$$

## Central charge

The topological central charge is given by
$c_{\rm top} = 2p(\lambda+2p)−2+2(r|2p+1) \bmod 8$.

## $so(2p+1)_2$ CFT

The $so(2p+1)_2$ CFTs correspond to the following values, $r=1$,
$\kappa = (2p+1\|2) = (-1)^{p(p+1)/2}$ and $\lambda = -1$.
These CFTs have central charge $c=2p$, in agreement with the fomula above.

# References

* [Classification of Metaplectic Fusion Categories](https://arxiv.org/abs/1608.03762v2)
* [Classification of Metaplectic Modular Categories](https://arxiv.org/abs/1601.05460v1)
* [alatc package](https://github.com/ardonne/affine-lie-algebra-tensor-category)
