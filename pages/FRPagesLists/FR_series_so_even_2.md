---
title: $ so(2p)_2$
layout: default
keywords: Fusion Ring, Series, Affine Lie Algebra, Special Orthogonal
---
# $ so(2p)_2 $

These fusion rings are called metaplectic fusion rings.

# Particle labels

The fusion ring has the following basis

$$
(\mathbf{1}, \epsilon, \eta_+, \eta_-, \psi_+, \psi_-, \bar\psi_+, \bar\psi_-, \phi_1, \ldots, \phi_p )
$$

of $p + 7$ elements.

The particles have the following quantum dimensions

| Particle | $\fpdim$ |
|:=========|:=========|
|$\mathbf{1}$| $1$ |
|$\epsilon    $| $1$ |
|$\eta_\pm    $| $1$ |
|$\psi_\pm  $| $\sqrt{p}$|
|$\bar\psi_\pm   $| $\sqrt{p}$|
|$\phi_i    $| $2$ |


# Fusion Rules

There are some differences in properties between even and odd values of $p$. One of the  differences is apparent in the fusion rules, e.g. for odd $p$ $so(2p)_2$ contains a $\bbz_4$ subring while for even $p$ this is a $\bbz_2 \times \bbz_2$ subring. Also the action of the group subring on the other particles differs.

In both cases the multiplication is commutative, and can more easily be described by splitting up the particles in blocks according to quantum dimensions:

  \\[
  ( \mathbf{1}, \epsilon, \eta_+, \eta_-\ \|\ \psi_+, \psi_-, \bar\psi_+, \bar\psi_-\ \|\ \phi_1, \ldots, \phi_{p - 1})
  \\]

## $p$ odd



* $\mathbf{1}, \epsilon, \eta_+,$ and $\eta_-$ form a $\bbz_4$ fusion ring where $\epsilon$ squares to the unit.
* The action of this $\bbz_4$ fusion ring permutes the particles within their blocks as follows:

$$
\begin{array}{lll}
\epsilon \times \psi_\pm = \bar\psi_\pm & \eta_+ \times \psi_+ = \psi_- & \eta_- \times \psi_+ = \bar\psi_- \\
\epsilon \times \bar\psi_\pm = \psi_\pm & \eta_+ \times \psi_- = \bar\psi_+ & \eta_- \times \psi_- = \psi_+ \\
\epsilon \times \phi_j = \phi_j & \eta_+ \times \bar\psi_+ = \bar\psi_- & \eta_- \times \bar\psi_+ = \psi_- \\
\eta_{\pm} \times \phi_j = \phi_{p-j} & \eta_+ \times \bar\psi_- = \psi_+ & \eta_- \times \bar\psi_- = \bar\psi_+ 
\end{array}
$$

* The particles $\psi_+, \psi_-, \bar\psi_+$ and $\bar\psi_-$ multiply among each other as follows

$$
\begin{array}{ll}
\psi_\pm \times \psi_\pm = \bar\psi_\pm \times \bar\psi_\pm = \eta_\mp + \sum_{j, \text{odd}} \phi_j & 
\psi_\pm \times \bar\psi_\pm = \eta_\pm + \sum_{j, \text{odd}} \phi_j \\
\psi_\pm \times \psi_\mp = \bar\psi_\pm \times \bar\psi_\mp = \mathbf{1} + \sum_{j, \text{even}} \phi_j &
\psi_\pm \times \bar\psi_\mp = \epsilon + \sum_{j, \text{even}} \phi_j
\end{array}
$$

* and they multiply with the $\phi_j$ particles according to the following rules

$$
\begin{array}{l}
\psi_+ \times \phi_{j, \text{odd}} =
\bar\psi_+ \times \phi_{j, \text{odd}} =
\psi_- \times \phi_{j, \text{even}} =
\bar\psi_- \times \phi_{j, \text{even}} = \psi_- + \bar\psi_- \\
\psi_+ \times \phi_{j, \text{even}} =
\bar\psi_+ \times \phi_{j, \text{even}} =
\psi_- \times \phi_{j, \text{odd}} =
\bar\psi_- \times \phi_{j, \text{odd}} = \psi_+ + \bar\psi_+
\end{array}
$$

* The $\phi_j$ particles multiply among themselves according to the following rules (recall that $p$ is odd)

$$
\begin{array}{l}
\phi_j \times \phi_j =
\begin{cases}
\mathbf{1} + \epsilon + \phi_{2j} & \text{if $2j < p$}\\
\mathbf{1} + \epsilon + \phi_{2p-2j} & \text{if $2j > p$}\\
\end{cases}
\\
\phi_j \times \phi_{k \neq j} =
\begin{cases}
\phi_{|j - k|} +  \phi_{j + k} & \text{if $j + k < p$}\\
\phi_{|j - k|} + \eta_+ + \eta_- & \text{if $j + k = p$}\\
\phi_{|j - k|} +  \phi_{2p - j - k} & \text{if $j + k > p$}
\end{cases}
\end{array}
$$


## $p$ even

*  $\mathbf{1}, \epsilon, \eta_+,$ and $\eta_-$ form a $\bbz_2 \times \bbz_2$ fusion ring.
* The action of this $\bbz_2 \times \bbz_2$ fusion ring permutes the particles within their blocks as follows:

$$
\begin{array}{lll}
\epsilon \times \psi_\pm = \bar\psi_\pm & \eta_+ \times \psi_+ = \bar\psi_+ & \eta_- \times \psi_+ = \psi_+ \\
\epsilon \times \bar\psi_\pm = \psi_\pm & \eta_+ \times \psi_- = \psi_- & \eta_- \times \psi_- = \bar\psi_- \\
\epsilon \times \phi_j  = \phi_j  & \eta_+ \times \bar\psi_+ = \psi_+ & \eta_- \times \bar\psi_+ = \bar\psi_+ \\
\eta_\pm \times \phi_j = \phi_{p-j} & \eta_+ \times \bar\psi_- = \bar\psi_- & \eta_- \times \bar\psi_- = \psi_-
\end{array}
$$

* The particles $\psi_+, \psi_-, \bar\psi_+$ and $\bar\psi_-$ multiply among each other as follows

$$
\begin{array}{ll}
\psi_\pm \times \psi_\pm = \bar\psi_\pm \times \bar\psi_\pm = \mathbf{1} + \eta_\mp + \sum_{j, \text{even}} \phi_j &
\psi_\pm \times \bar\psi_\pm = \epsilon + \eta_\pm + \sum_{j, \text{even}} \phi_j \\
\psi_\pm \times \psi_\mp = \bar\psi_\pm \times \bar\psi_\mp = \sum_{j, \text{odd}} \phi_j &
\psi_\pm \times \bar\psi_\mp = \sum_{j, \text{odd}} \phi_j
\end{array}
$$

* and they act on the $\phi_j$ particles as follows

$$
\begin{array}{l}
\psi_+ \times \phi_{j, \text{odd}} = \bar\psi_+ \times \phi_{j, \text{odd}} = \psi_- \times \phi_{j, \text{even}} = \bar\psi_- \times \phi_{j, \text{even}} =  \psi_- + \bar\psi_- \\
\psi_+ \times \phi_{j, \text{even}} =  \bar\psi_+ \times \phi_{j, \text{even}} = \psi_- \times \phi_{j, \text{odd}} =  \bar\psi_- \times \phi_{j, \text{odd}} =  \psi_+ + \bar\psi_+
\end{array}
$$

* Finally, the last fusion rules between the fields $\phi_j$ read

$$
\begin{array}{l}
\phi_j \times \phi_j =
\begin{cases}
\mathbf{1} + \epsilon + \phi_{2j} & \text{if $2j < p$}\\
\mathbf{1} + \epsilon + \eta_+ + \eta_- & \text{if $2j = p$}\\
\mathbf{1} + \epsilon + \phi_{2p-2j} & \text{if $2j > p$}\\
\end{cases} \\
\phi_j \times \phi_{k\neq j} =
\begin{cases}
\phi_{|j-k|} +  \phi_{j + k} & \text{if $j + k < p$}\\
\phi_{|j-k|} +  \eta_+ + \eta_- & \text{if $j + k = p$}\\
\phi_{|j-k|} +  \phi_{2p - j - k} & \text{if $j + k > p$}
\end{cases}
\end{array}
$$


# Modular Data

We concentrate (for now) on a particular example of the modular data,
namely the case corresponding to the $c=1$ $\mathbf{Z}_2$ orbifold models.
For these models, we give the elements of the matrix $\tilde{S} = \sqrt{8p} S$,
where $S$ is the modular $S$-matrix.

$$
\begin{array}{llllll}
\tilde{S}_{\mathbf{1},\mathbf{1}} = 1
\\
\tilde{S}_{\mathbf{1},\epsilon} = 1 &
\tilde{S}_{\epsilon,\epsilon} = 1 
\\
\tilde{S}_{\mathbf{1},\eta_\pm} = 1 &
\tilde{S}_{\epsilon,\eta_\pm} = 1 &
\tilde{S}_{\eta_\pm,\eta_\pm} = (-1)^p 
\\
& & \tilde{S}_{\eta_\pm,\eta_\mp} = (-1)^p
\\
\tilde{S}_{\mathbf{1},\psi_\pm} = \sqrt{p} &
\tilde{S}_{\epsilon,\psi_\pm} = -\sqrt{p} &
\tilde{S}_{\eta_\pm,\psi_\pm} = -\sqrt{p} e^{-i\pi p/2} &
\tilde{S}_{\psi_\pm,\psi_\pm} = \sqrt{p/2} (1 + e^{-i\pi p/2})
\\
& & \tilde{S}_{\eta_\pm,\psi_\mp} = \sqrt{p} e^{-i\pi p/2} &
\tilde{S}_{\psi_\pm,\psi_\mp} = \sqrt{p/2} (1 - e^{-i\pi p/2})
\\
\tilde{S}_{\mathbf{1},\bar\psi_\pm} = \sqrt{p} &
\tilde{S}_{\epsilon,\bar\psi_\pm} = -\sqrt{p} &
\tilde{S}_{\eta_\pm,\bar\psi_\pm} = -\sqrt{p} e^{-i\pi p/2} &
\tilde{S}_{\psi_\pm,\bar\psi_\pm} = -\sqrt{p/2} (1 + e^{-i\pi p/2}) &
\tilde{S}_{\bar\psi_\pm,\bar\psi_\pm} = \sqrt{p/2} (1 + e^{-i\pi p/2}) &
\\
& & \tilde{S}_{\eta_\pm,\bar\psi_\mp} = \sqrt{p} e^{-i\pi p/2} &
\tilde{S}_{\psi_\pm,\bar\psi_\mp} = -\sqrt{p/2} (1 - e^{-i\pi p/2}) &
\tilde{S}_{\bar\psi_\pm,\bar\psi_\mp} = \sqrt{p/2} (1 - e^{-i\pi p/2})
\\
\tilde{S}_{\mathbf{1},\phi_j} = 2 & 
\tilde{S}_{\epsilon,\phi_j} = 2 &
\tilde{S}_{\eta_\pm,\phi_j} = (-1)^j \ 2 &
\tilde{S}_{\psi_\pm,\phi_j} = 0 &
\tilde{S}_{\bar\psi_\pm,\phi_j} = 0 &
\tilde{S}_{\phi_j,\phi_k} = 4 \cos(\pi j k/p) 
\end{array}
$$

We state the twist factors in terms of the scaling dimensions $h_X$ of the
orbifold models, via $\theta_X = e^{2\pi i h_X}$. The scaling dimensions are
given by

$$
\begin{array}{llllll}
h_\mathbf{1} = 0 &
h_\epsilon = 1 &
h_{\eta_\pm} = \frac{p}{4} &
h_{\psi_\pm} = \frac{1}{16} &
h_{\bar\psi_\pm} = \frac{9}{16} &
h_{\phi_j} = \frac{j^2}{4p}
\end{array}
$$

The corresponding topological central charge is given by $c_{\rm top} = 1$, which
direclty corresponds to the central charge $c=1$ of the orbifold models.

The $S$-matrix takes the form

$$
[S] = \frac{1}{\sqrt{8p}}
\begin{bmatrix}
1 & 1 & 1 & \sqrt{p} & \sqrt{p} & 2 \\
1 & 1 & 1 & -\sqrt{p} & -\sqrt{p} & 2 \\
1 & 1 & (-1)^p & [b]^i_j & [b]^i_j & 2 (-1)^\mu  \\
\sqrt{p} & -\sqrt{p} & [b]^i_j & [a]^i_j & -[a]^i_j & 0\\
\sqrt{p} & -\sqrt{p} & [b]^i_j & -[a]^i_j & [a]^i_j & 0\\
2 & 2 &  2 (-1)^\lambda  & 0 & 0 & [c]^\lambda_\mu
\end{bmatrix}
$$

where the matrices coresponding to $a,b,c$ have entries

$$
\begin{array}{l}
[a]^i_j = \sqrt{\frac{p}{2}} (1+(2\delta^i_j-1) e^{-\pi i p/2}) \\
[b]^i_j = (-1)^{p+\delta^i_j} \sqrt{p} e^{\pi i p/2} \\
[c]^\lambda_\mu = 4\cos\frac{\pi \lambda\mu}{p}
\end{array}
$$

<!-- # Examples for small $p$

_(Note that the notation and order of the particles on the fusion ring pages might differ from the one in this article)_ -->

# References

* [Dimension as a quantum statistic and the classification of metaplectic categories](https://arxiv.org/abs/1710.10284v3)
* [Modular Categories of Dimension $p^3 m$ with
  $m$ Square-Free](https://arxiv.org/abs/1609.04896v3)
