---
layout: page
title: List of Small Multiplicity-Free Fusion Categories
---

# This page is still in construction.
We will work hard to make the information below accessible in a user friendly way but for now we'll just provide the solutions and an explanation on how to use them.


The solutions of the pentagon and hexagon equations for all multiplicity free fusion categories up to and including rank 6 can in the can be downloaded from the following links

* [Numeric solutions]({% link data/NumericCategories.zip%})
* [Symbolic solutions]({% link data/Categories.zip %})

These should be all the solutions, both unitary and non-unitary, braided and non-braided, and for all admissible sets of possible $0$-values for the $F$-symbols.

# Numeric solutions
The numeric solutions are organized as follows. For each fusion ring there is a folder that contains several files named ```pentsol_i.txt``` and ```hexsol_i_j.txt```. The index ```i``` labels a solution to the pentagon equations and the index ```j``` labels a solution to the hexagon equations with $F$-symbols coming from ```pentsol_i.txt```. The pentsol files contain rows of tab-separated numbers of which the first 6 correspond to the anyon labels and the last two to the real and imaginary parts of the F-symbol. The same format is used for the hexsol files.

**Note that the ordering of the anyon labels might differ from that on the wiki!**

Every folder contains a file with structure constants that define the labeling of the particles so one can find out how to permute the labels of the solutions, if necessary.

# Symbolic solutions
For now, the file with solutions is a zipped directory that contains a file for each fusion ring up to rank 6, labeled by the formal notation used in [the list of small multiplicity free fusion rings]({% link pages/Lists/losmffr.md%}).
The files are Wolfram Language Data files in the .wdx format which have to be imported via the ```Import``` command. For people who don't have Mathematica and still want the symbolic solutions you can download the free version of the Wolfram Language and that works as well.

The contents of each solution file is an ```Association``` with two elements:
  * the respective fusion ring, and
  * the solutions to the pentagon and hexagon equations.

To display the fusion ring properly it is advised to use the FusionRings package (see [the page on software]({% link pages/Lists/Software.md %}) for a link).
**It is important to note that the multiplication tables of these rings might differ from those on the wiki.**
The solutions match the fusion rings given in in the files so one might have to permute the labels of the $F$ and $R$-symbols if necessary.

The solutions themselves are lists of rules that map $F$ and $R$-symbols to their respective values. The solutions to the hexagon equations are joined with those of the pentagon equations. In particular, if a ring has $n$ solutions to the pentagon equations and each solutions has $m_n$ solutions to the hexagon equations then the file contains $\sum_{i=1}^n m_i$ solutions.






In the future we plan to:
* Add a page for each category,
* Make sure the $F$ and $R$ symbols in the solutions match their labels with the order of the elements on the wiki, rather than in the package
* Make the software used to find these categories publicly available
* Keep adding categories, of course :)
