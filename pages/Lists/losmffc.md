---
layout: page
title: List of Small Multiplicity-Free Fusion Categories
---

# This page is still in construction.
We will work hard to make the information below accessible in a user friendly way but for now we'll just provide the solutions and an explanation on how to use them.


The solutions of the pentagon and hexagon equations for most multiplicity free fusion categories up to and including rank 6 can in the meantime be downloaded from
[here]({% link data/Categories.zip %}). These should be all the solutions, both unitary an non-unitary, braided and non-braided, and for all admissible sets of possible $0$-values for the $F$-symbols, except for two cases: $\text{PSU}(2)_{10}$ (for which I haven't been able to force a unitary gauge yet) and $$ \text{FR}^{6,0}_{14}$$ which has as categorifications the direct product of those of $\text{Fib}$ and $\text{PSU}(2)_5$ but its 21h and I'm leaving for holidays tomorrow. These will be fixed the moment I'm back.
The file with solutions is a zipped directory that contains a file each fusion ring up to rank 6, labeled by the formal notation used in [the list of small multiplicity free fusion rings]({% link pages/Lists/losmffr.md%}).

The contents of each solution file is an ```Association``` with two elements:
  * the respective fusion ring, and
  * the solutions to the pentagon and hexagon equations.

These are wolfram data files and should be imported via the ```Import``` command. For people that don't have Mathematica: you can download the free version of the Wolfram Language and that works as well. We will work on making the data available in a more open format asap.
To display the fusion ring properly it is advised to use the FusionRings package (see [the page on software]({% link pages/Lists/Software.md %}) for a link). It is important to note that the multiplication tables of these rings might differ from those on the wiki. The solutions match the fusion rings given in in the files so one might have to permute the labels of the $F$ and $R$-symbols if necessary.
The solutions themselves are lists of rules that map $F$ and $R$-symbols to their respective values. The solutions to the hexagon equations are joined with those of the pentagon equations. In particular, if a ring has $n$ solutions to the pentagon equations and each solutions has $m_n$ solutions to the hexagon equations then the file contains $\sum_{i=1}^n m_i$ solutions.

There might be less solutions than expected since we not only removed solutions that gauge equivalent but also those that are equivalent up to fusion ring automorphisms. These solutions can be retained by applying the fusion ring automorphisms on the labels of the $F$-symbols. All fusion ring automorphisms can of a ring can be found either on the wiki or by using the command ```FusionRingAutomorphisms``` from the FusionRings package.

In the future we plan to:
* Add a page for each category,
* Make the data available in a format that any software package can retained
* Expand the number of categories via automorphisms so that users don't have to do this themselves
* Make sure the $F$ and $R$ symbols in the solutions match their labels with the order of the elements on the wiki, rather than in the package
* Make the software used to find these categories publicly available
* Keep adding categories of course :)
