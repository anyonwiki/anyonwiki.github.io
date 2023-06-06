// Based on a script by Kathie Decora : katydecorah.com/code/lunr-and-jekyll/

// Create the lunr index for the search
var index = elasticlunr(function () {
    this.addField('title')
    this.addField('author')
    this.addField('layout')
    this.addField('content')
    this.setRef('id')
});

// Add to this index the proper metadata from the Jekyll content
index.addDoc({
    id:      0,
    title:   "AMS-$\\LaTeX$ Theorem Styles",
    author:  null,
    layout:  "page",
    content: "Proof supports $\\LaTeX$ with [AMS] extensions, which provide various features\nto facilitate writing math formulas and to give the general structure and \nappearance of a mathematics article or book.\n\nIn particular, theorem styles including definition, theorem, lemma, \nproof, and a few more1 can be declared as an environment using this \ntemplate:\n\n**Theorem**{:.label #Lagrange}\n  _(Lagrange's Theorem)_\n  Let $$G$$ be a finite group, and let $$H$$ be a subgroup\n  of $$G$$.  Then the order of $$H$$ divides the order of $$G$$.\n{:.theorem}\n\n\nVarious components of this template can be skipped or customized, so experiment\nwith them. For instance, to use your own enumeration, use {:.label*} instead.\n\nAn Example\n\nThe following exposition is taken from [here].\nNote the minimal changes required\n\nLagrange’s Theorem\n\nDefinition\n  Let \\(H\\) be a subgroup of a group \\(G\\).  A left coset\n  of \\(H\\) in \\(G\\) is a subset of \\(G\\) that is of the form \\(xH\\),\n  where \\(x \\in G\\) and \\(xH = \\{ xh : h \\in H \\}\\).\n  Similarly a right coset of \\(H\\) in \\(G\\) is a subset\n  of \\(G\\) that is of the form \\(Hx\\), where\n  \\(Hx = \\{ hx : h \\in H \\}\\)\n\nNote that a subgroup \\(H\\) of a group \\(G\\) is itself a\nleft coset of \\(H\\) in \\(G\\).\n\nLemma\n  Let \\(H\\) be a subgroup of a group \\(G\\), and let \\(x\\) and \\(y\\) be\n  elements of \\(G\\).  Suppose that \\(xH \\cap yH\\) is non-empty.\n  Then \\(xH = yH\\).\n\nProof\n  Let \\(z\\) be some element of \\(xH \\cap yH\\).  Then \\(z = xa\\)\n  for some \\(a \\in H\\), and \\(z = yb\\) for some \\(b \\in H\\).\n  If \\(h\\) is any element of \\(H\\) then \\(ah \\in H\\) and\n  \\(a^{-1}h \\in H\\), since \\(H\\) is a subgroup of \\(G\\).\n  But \\(zh = x(ah)\\) and \\(xh = z(a^{-1}h)\\) for all \\(h \\in H\\).\n  Therefore \\(zH \\subset xH\\) and \\(xH \\subset zH\\), and thus\n  \\(xH = zH\\).  Similarly \\(yH = zH\\), and thus \\(xH = yH\\),\n  as required.\n\nLemma\n  Let \\(H\\) be a finite subgroup of a group \\(G\\).  Then each left\n  coset of \\(H\\) in \\(G\\) has the same number of elements as \\(H\\).\n\nProof\n  Let \\(H = \\{ h_1, h_2,\\ldots, h_m\\}\\), where\n  \\(h_1, h_2,\\ldots, h_m\\) are distinct, and let \\(x\\) be an\n  element of \\(G\\).  Then the left coset \\(xH\\) consists of\n  the elements \\(x h_j\\) for \\(j = 1,2,\\ldots,m\\).\n  Suppose that \\(j\\) and \\(k\\) are integers between\n  \\(1\\) and \\(m\\) for which \\(x h_j = x h_k\\).  Then\n  \\(h_j = x^{-1} (x h_j) = x^{-1} (x h_k) = h_k\\),\n  and thus \\(j = k\\), since \\(h_1, h_2,\\ldots, h_m\\)\n  are distinct.  It follows that the elements\n  \\(x h_1, x h_2,\\ldots, x h_m\\) are distinct.\n  We conclude that the subgroup \\(H\\) and the left\n  coset \\(xH\\) both have \\(m\\) elements,\n  as required.\n\nTheorem\n(Lagrange’s Theorem)\n  Let \\(G\\) be a finite group, and let \\(H\\) be a subgroup\n  of \\(G\\).  Then the order of \\(H\\) divides the order of \\(G\\).\n\nProof\n  Each element \\(x\\) of \\(G\\) belongs to at least one left coset\n  of \\(H\\) in \\(G\\) (namely the coset \\(xH\\)), and no element\n  can belong to two distinct left cosets of \\(H\\) in \\(G\\)\n  (see Lemma).  Therefore every\n  element of \\(G\\) belongs to exactly one left coset of \\(H\\).\n  Moreover each left coset of \\(H\\) contains \\(|H|\\) elements\n  (see Lemma).  Therefore \\(|G| = n |H|\\),\n  where \\(n\\) is the number of left cosets of \\(H\\) in \\(G\\).\n  The result follows.\n\n\n\n\n  \n    \n\n      The full list is: theorem lemma problem proposition conjecture\ncorollary definition example exercise remark note.\n[AMS]: (http://www.ams.org/publications/authors/tex/amslatex)\n[here]: (https://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/Theorems.html) &#x21a9;&#xfe0e;\n    \n  \n\n",
});
index.addDoc({
    id:      1,
    title:   "Typesetting Math with $\\KaTeX$",
    author:  null,
    layout:  "page",
    content: "Proof supports the typesetting mathematics using $\\KaTeX$.\nYou can use $ .. $ to write formulas following the $\\LaTeX$ math syntax:\n\nThe function $\\nu$ is written inline, but can also be in a block:\n\\\\[ \\nu: \\mathbb{P}^{1} \\to \\mathbb{P}^{3} \\\\]\n\n\nThe function $\\nu$ is written inline, but can also be in a block:\n\\[ \\nu: \\R\\P^{1} \\to \\P^{3}. \\]\n\nMultiple math formats work:\n\n  $5\\times 5$ gives $5\\times 5.$\n  \\\\(5\\times 5\\\\) gives \\(5\\times 5.\\)\n  \\\\[5\\times 5.\\\\] gives: \\[5\\times 5.\\]\n\n\nNote: while $$ 5\\times 5 $$ also works, it will enclose the math in a \nscript tag, which is undesirable1.\n\n$\\KaTeX$ supports a long list of fonts and functions, but you can also add\n$\\LaTeX$ macros in &lt;script&gt; tags. For instance:\n\n&lt;script&gt;\nmacros[\"\\\\f\"] = \"\\\\mathscr{F}\"\n&lt;/script&gt;\n\n\n\n\n\\[ 0\\to\\Gamma_Y(X,\\f’)\\to\\Gamma_Y(X,\\f)\\to\\Gamma_Y(X,\\f’’)\\to 0. \\]\n\nIf you are not familiar with writing mathematics in $\\LaTeX$, I highly \nrecommend reading and bookmarking this Wikibooks reference and using\nit to typeset problem sets or exercises to practice. Another great reference\nis this “short” guide by the AMS. To learn more about $\\LaTeX$ itself,\nD.R.Wilkins’ Primer is a decent place to start.\n\n\n  \n    \n\n      This will change once this issue is fixed. &#x21a9;&#xfe0e;\n    \n  \n\n",
});

// Builds reference data (maybe not necessary for us, to check)
var store = [
    {
	"title":  "AMS-$\\LaTeX$ Theorem Styles",
	"author": null,
	"layout": "page",
	"link":   "/examples/2019/05/26/ams-latex.html",
    },
    {
	"title":  "Typesetting Math with $\\KaTeX$",
	"author": null,
	"layout": "page",
	"link":   "/examples/2019/05/27/katex.html",
    }
]

// Query
var searchDiv = $("#x-search-query");
var resultDiv = $("#results");
var searchParams = new URLSearchParams(window.location.search)
if (searchParams.has('q')) {
    searchDiv.value = searchParams.get('q');
}

function doSearch() {
    var query = searchDiv.val();
    if (query.length <= 3) {
	resultDiv.empty();
	return;
    }

    // The search is then launched on the index built with Lunr
    var result = index.search(query);
    resultDiv.empty();
    if (result.length == 0) {
	resultDiv.append('<p class="">No results found.</p>');
    } else if (result.length == 1) {
	resultDiv.append('<p class="">Found '+result.length+' result</p>');
    } else {
	resultDiv.append('<p class="">Found '+result.length+' results</p>');
    }
    // Loop through, match, and add results
    for (var item in result) {
	var ref = result[item].ref;
	var searchitem = '<div class="result"><p><a href="'+store[ref].link+'?q='+query+'">'+store[ref].title+'</a></p></div>';
	resultDiv.append(searchitem);
    }

}

// something not working
$(document).ready(function() {
    if (searchParams.has('q')) {
	searchDiv.val(searchParams.get('q'));
	doSearch();
    }
    searchDiv.on('keyup', doSearch);
});
