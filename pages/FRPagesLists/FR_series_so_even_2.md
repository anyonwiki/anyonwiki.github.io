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

<!--
\\[
  ( \mathbf{1}, \Theta, \Phi^1, \Phi^2, \sigma^1, \sigma^2, \tau^1, \tau^2, \phi_1, \ldots, \phi_{p - 1}),
\\]
-->

of $p + 7$ elements.

<!--
To specify the fusion rules, we make use of an alternative notation for the fields, namely
-->

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

<!--
$$
\begin{array}{lll}
\Theta \times \sigma^i = \tau^i         & \Phi^1 \times \sigma^1  = \sigma^2  & \Phi^2 \times \sigma^1=\tau^2 \\
\Theta \times \tau^i   = \sigma^i       & \Phi^1 \times \sigma^2  = \tau^1    & \Phi^2 \times \sigma^2=\sigma^1 \\
\Theta \times \phi_\lambda=\phi_\lambda & \Phi^1 \times \tau^1    = \tau^2    & \Phi^2 \times \tau^1=\sigma^2 \\
\Phi^i \times \phi_\lambda  = \phi_{p-\lambda} & \Phi^1 \times \tau^2 = \sigma^1  & \Phi^2 \times \tau^2=\tau^1
\end{array}
$$

In terms of the other notation, these fusion rules read
-->

$$
\begin{array}{lll}
\epsilon \times \psi_\pm = \bar\psi_\pm & \eta_+ \times \psi_+ = \psi_- & \eta_- \times \psi_+ = \bar\psi_- \\
\epsilon \times \bar\psi_\pm = \psi_\pm & \eta_+ \times \psi_- = \bar\psi_+ & \eta_- \times \psi_- = \psi_+ \\
\epsilon \times \phi_\lambda = \phi_\lambda & \eta_+ \times \bar\psi_+ = \bar\psi_- & \eta_- \times \psi_+ = \bar\psi_- \\
\eta_{\pm} \times \phi_j = \phi_{p-j} & \eta_+ \times \bar\psi_- = \psi_+ & \eta_- \times \bar\psi_- = \bar\psi_+ 
\end{array}
$$

* The particles $\psi_+, \psi_-, \bar\psi_+$ and $\bar\psi_-$ multiply among each other as follows

<!--
$$
\begin{array}{ll}
\sigma^1 \times \sigma^1=\tau^1 \times \tau^1=\Phi^2+\sum_{\lambda \text { odd }} \phi_\lambda &
\sigma^1 \times \tau^1=\Phi^1+\sum_{\lambda \text { odd }} \phi_\lambda \\
\sigma^2 \times \sigma^2=\tau^2 \times \tau^2=\Phi^1+\sum_{\lambda \text { odd }} \phi_\lambda &
\sigma^2 \times \tau^2=\Phi^2+\sum_{\lambda \text { odd }} \phi_\lambda \\
\sigma^1 \times \sigma^2=\tau^1 \times \tau^2=\mathbf{1}+\sum_{\lambda \text { even }} \phi_\lambda &
\sigma^1 \times \tau^2=\sigma^2 \times \tau^1=\Theta+\sum_{\lambda \text { even }} \phi_\lambda \\
\end{array}
$$
-->

$$
\begin{array}{ll}
\psi_\pm \times \psi_\pm = \bar\psi_\pm \times \bar\psi_\pm = \eta_\mp + \sum_{j \text { odd }} \phi_j & 
\psi_\pm \times \bar\psi_\pm = \eta_\pm + \sum_{j \text { odd }} \phi_j \\
\psi_\pm \times \psi_\mp = \bar\psi_\pm \times \bar\psi_\mp = \mathbf{1} + \sum_{j \text { even }} \phi_j &
\psi_\pm \times \bar\psi_\mp = \epsilon + \sum_{j \text { even }} \phi_j
\end{array}
$$

* and they multiply with the $\phi_\lambda$ particles according to the following rules

<!--
$$
\begin{array}{l}
\sigma^1 \times \phi_{\lambda, \text { odd }}=\tau^1 \times \phi_{\lambda, \text { odd }}=\sigma^2 \times \phi_{\lambda, \text { even }}=\tau^2 \times \phi_{\lambda, \text { even }}=\sigma^2+\tau^2 \\
\sigma^1 \times \phi_{\lambda, \text { even }}=\tau^1 \times \phi_{\lambda, \text { even }}=\sigma^2 \times \phi_{\lambda, \text { odd }}=\tau^2 \times \phi_{\lambda, \text { odd }}=\sigma^1+\tau^1 \\
\end{array}
$$
-->

$$
\begin{array}{l}
\psi_+ \times \phi_{j, \text { odd }} =
\bar\psi_+ \times \phi_{j, \text { odd }} =
\psi_- \times \phi_{j, \text { even }} =
\bar\psi_- \times \phi_{j, \text { even }} = \psi_- + \bar\psi_- \\
\psi_+ \times \phi_{j, \text { even }} =
\bar\psi_+ \times \phi_{j, \text { even }} =
\psi_- \times \phi_{j, \text { odd }} =
\bar\psi_- \times \phi_{j, \text { odd }} = \psi_+ + \bar\psi_+
\end{array}
$$

* The $\phi_\lambda$ particles multiply among themselves according to the following rules (recall that $p$ is odd)

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

*  $\mathbf{1}, \Theta, \Phi^1,$ and $\Phi^2$ form a $\bbz_2 \times \bbz_2$ fusion ring.
* The action of this $\bbz_2 \times \bbz_2$ fusion ring permutes the particles within their blocks as follows:

$$
\begin{array}{lll}
\Theta \times \sigma^{i}    = \tau^{i}      & \Phi^{1} \times \sigma^{1} = \tau^{1}   & \Phi^{2} \times \sigma^{1} = \sigma^{1} \\
\Theta \times \tau^{i}      = \sigma^{i}    & \Phi^{1} \times \sigma^{2} = \sigma^{2} & \Phi^{2} \times \sigma^{2} = \tau^{2} \\
\Theta \times \phi_\lambda  = \phi_\lambda  & \Phi^{1} \times \tau^{1} = \sigma^{1} & \Phi^{2} \times \tau^{1} = \tau^{1} \\
\Phi^{i} \times \phi_\lambda = \phi_{p-\lambda} & \Phi^{1} \times \tau^{2} = \tau^{2} & \Phi^{2} \times \tau^{2} = \sigma^{2}
\end{array}
$$

* The particles $\sigma^1, \sigma^2, \tau^1,$ and $ \tau^2$ multiply among each other as follows

$$
\begin{array}{ll}
\sigma^{1} \times \sigma^{1} = \tau^{1} \times \tau^{1} = \mathbf{1} + \Phi^{2} + \sum_{\lambda\;{\rm even}} \phi_\lambda &
\sigma^{1} \times \tau^{1} = \Theta + \Phi^{1} + \sum_{\lambda\;{\rm even}} \phi_\lambda \\
\sigma^{2} \times \sigma^{2} = \tau^{2} \times \tau^{2} = \mathbf{1} + \Phi^{1} + \sum_{\lambda\;{\rm even}} \phi_\lambda &
\sigma^{2} \times \tau^{2} = \Theta + \Phi^{2} + \sum_{\lambda\;{\rm even}} \phi_\lambda \\
\sigma^{1} \times \sigma^{2} = \tau^{1} \times \tau^{2} = \sum_{\lambda\;{\rm odd}} \phi_\lambda &
\sigma^{1} \times \tau^{2} = \sigma^{2} \times \tau^{1} = \sum_{\lambda\;{\rm odd}} \phi_\lambda \end{array}
$$

* and they act on the $\phi_\lambda$ particles as follows

$$
\begin{array}{l}
\sigma^{1} \times \phi_{\lambda,\, {\rm odd}} = \tau^{1} \times \phi_{\lambda,\, {\rm odd}} = \sigma^{2} \times \phi_{\lambda,\, {\rm even}} = \tau^{2} \times \phi_{\lambda,\, {\rm even}} =  \sigma^{2} + \tau^{2} \\
\sigma^{1} \times \phi_{\lambda,\, {\rm even}} =  \tau^{1} \times \phi_{\lambda,\, {\rm even}} = \sigma^{2} \times \phi_{\lambda,\, {\rm odd}} =  \tau^{2} \times \phi_{\lambda,\, {\rm odd}} =  \sigma^{1} + \tau^{1}
\end{array}
$$

* Finally, the last fusion rules between the fields $\phi_\lambda$ read

$$
\begin{array}{l}
\phi_\lambda \times \phi_\lambda =
\begin{cases}
\mathbf{1} + \Theta + \phi_{2\lambda} & \text{if $2\lambda < p$}\\
\mathbf{1} + \Theta + \Phi^{1} + \Phi^{2} & \text{if $2\lambda = p$}\\
\mathbf{1} + \Theta + \phi_{2(p-\lambda)} & \text{if $2\lambda > p$}\\
\end{cases} \\
\phi_\lambda \times \phi_\mu =
\begin{cases}
\phi_{|\lambda-\mu|} +  \phi_{\lambda+\mu} & \text{if $\lambda + \mu < p$}\\
\phi_{|\lambda-\mu|} +  \phi_{2p-\lambda-\mu} & \text{if $\lambda + \mu > p$}
\end{cases} \\
\phi_\lambda \times \phi_{p-\lambda} = \Phi^{1} + \Phi^{2} + \phi_{|p-2\lambda|} \\
\end{array}
$$


# Modular Data
The modular $S$-matrix can be written in a compact way in the following form.

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
[a]^i_j = \sqrt{\frac{p}{2}} (1+(2\delta^i_j-1)) e^{-\pi i p/2} \\
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
