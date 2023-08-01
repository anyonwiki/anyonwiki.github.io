---
layout: default
title: Indexing of Roots
---
# Indexing of Roots of Polynomials


The indexing of roots of a polynomial (sometimes written as $$\text{Root}[p,i]$$) takes the real roots first, in increasing order. For polynomials with rational coefficients, the complex conjugate pairs of roots have consecutive indices where the roots with a negative imaginary part have a lower index than their conjugate. The following picture shows a plot of the polynomial $$ p = (x-1) \left(x^2-3\right) \left(x^2+x+2\right) \left(x^3+1\right)$$ and the indexing of its roots.


![Numbering of roots of a rational polynomial]( /images/RootNumberingRational.jpeg "Numbering of roots of a rational polynomial" )

If a polynomial has non-rational coefficients then its roots might be described via expressions of the form $$\text{Root}[\{p_1,\ldots,p_n\},\{k_1,\ldots,k_n\}]$$ where the $$p_i$$ form a triangular system of polynomials and the value of this root is defined as follows: Given equations $$p_1(x_1) = 0,\ p_2(x_1,x_2) = 0, \ldots, p_n(x_1,\ldots,x_n) = 0$$ we recursively define $$r_1$$ as the $$k_1'$$th root of $$p_1(x_1) = 0$$, $$r_2$$ as the $$k_2'$$th root of $$p_2(r_1,x_2)=0$$, and finally $$r_n$$ as the $$k_n'$$th root of $$p_n(r_1,\ldots,r_{n-1},x_n)=0$$. The represented root is then the value of $r_n$
