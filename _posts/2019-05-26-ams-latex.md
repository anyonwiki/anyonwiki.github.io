---
layout: page
title: AMS-$\LaTeX$ Theorem Styles
categories: examples
date: 2019-05-26
---

Proof supports $\LaTeX$ with [AMS] extensions, which provide various features
to facilitate writing math formulas and to give the general structure and 
appearance of a mathematics article or book.

In particular, theorem styles including `definition`, `theorem`, `lemma`, 
`proof`, and a few more[^fn1] can be declared as an environment using this 
template:

~~~ markdown
**Theorem**{:.label #Lagrange}
  _(Lagrange's Theorem)_
  Let $$G$$ be a finite group, and let $$H$$ be a subgroup
  of $$G$$.  Then the order of $$H$$ divides the order of $$G$$.
{:.theorem}
~~~

Various components of this template can be skipped or customized, so experiment
with them. For instance, to use your own enumeration, use `{:.label*}` instead.

## An Example
{:.label}

The following exposition is taken from [here].
Note the minimal changes required

### Lagrange's Theorem
{:.label}

**Definition**{:.label}
  Let $$H$$ be a subgroup of a group $$G$$.  A _left coset_
  of $$H$$ in $$G$$ is a subset of $$G$$ that is of the form $$xH$$,
  where $$x \in G$$ and $$xH = \{ xh : h \in H \}$$.
  Similarly a _right coset_ of $$H$$ in $$G$$ is a subset
  of $$G$$ that is of the form $$Hx$$, where
  $$Hx = \{ hx : h \in H \}$$
{:.definition*}

Note that a subgroup $$H$$ of a group $$G$$ is itself a
left coset of $$H$$ in $$G$$.


**Lemma**{:.label #LeftCosetsDisjoint}
  Let $$H$$ be a subgroup of a group $$G$$, and let $$x$$ and $$y$$ be
  elements of $$G$$.  Suppose that $$xH \cap yH$$ is non-empty.
  Then $$xH = yH$$.
{:.lemma}

**Proof**{:.label}
  Let $$z$$ be some element of $$xH \cap yH$$.  Then $$z = xa$$
  for some $$a \in H$$, and $$z = yb$$ for some $$b \in H$$.
  If $$h$$ is any element of $$H$$ then $$ah \in H$$ and
  $$a^{-1}h \in H$$, since $$H$$ is a subgroup of $$G$$.
  But $$zh = x(ah)$$ and $$xh = z(a^{-1}h)$$ for all $$h \in H$$.
  Therefore $$zH \subset xH$$ and $$xH \subset zH$$, and thus
  $$xH = zH$$.  Similarly $$yH = zH$$, and thus $$xH = yH$$,
  as required.
{:.proof}


**Lemma**{:.label #SizeOfLeftCoset}
  Let $$H$$ be a finite subgroup of a group $$G$$.  Then each left
  coset of $$H$$ in $$G$$ has the same number of elements as $$H$$.
{:.lemma}

**Proof**{:.label}
  Let $$H = \{ h_1, h_2,\ldots, h_m\}$$, where
  $$h_1, h_2,\ldots, h_m$$ are distinct, and let $$x$$ be an
  element of $$G$$.  Then the left coset $$xH$$ consists of
  the elements $$x h_j$$ for $$j = 1,2,\ldots,m$$.
  Suppose that $$j$$ and $$k$$ are integers between
  $$1$$ and $$m$$ for which $$x h_j = x h_k$$.  Then
  $$h_j = x^{-1} (x h_j) = x^{-1} (x h_k) = h_k$$,
  and thus $$j = k$$, since $$h_1, h_2,\ldots, h_m$$
  are distinct.  It follows that the elements
  $$x h_1, x h_2,\ldots, x h_m$$ are distinct.
  We conclude that the subgroup $$H$$ and the left
  coset $$xH$$ both have $$m$$ elements,
  as required.
{:.proof}


**Theorem**{:.label #Lagrange}
_**(Lagrange's Theorem)**_
  Let $$G$$ be a finite group, and let $$H$$ be a subgroup
  of $$G$$.  Then the order of $$H$$ divides the order of $$G$$.
{:.theorem}

**Proof**{:.label}
  Each element $$x$$ of $$G$$ belongs to at least one left coset
  of $$H$$ in $$G$$ (namely the coset $$xH$$), and no element
  can belong to two distinct left cosets of $$H$$ in $$G$$
  (see [Lemma](#LeftCosetsDisjoint)).  Therefore every
  element of $$G$$ belongs to exactly one left coset of $$H$$.
  Moreover each left coset of $$H$$ contains $$|H|$$ elements
  (see [Lemma](#SizeOfLeftCoset)).  Therefore $$|G| = n |H|$$,
  where $$n$$ is the number of left cosets of $$H$$ in $$G$$.
  The result follows.
{:.proof}

{::comment} fix lemma reference numberings {:/}

[^fn1]:
	The full list is: `theorem lemma problem proposition conjecture
	corollary definition example exercise remark note`.
[AMS]: (http://www.ams.org/publications/authors/tex/amslatex)
[here]: (https://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/Theorems.html)
