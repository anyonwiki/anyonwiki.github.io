---
---

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
{%- assign count = 0 %}
{%- for text in site.documents %}
index.addDoc({
    id:      {{ count }},
    title:   {{ text.title   | jsonify }},
    author:  {{ text.author  | jsonify }},
    layout:  {{ text.layout  | jsonify }},
    content: {{ text.content | jsonify | strip_html }},
});
{%- assign count = count | plus: 1 %}
{%- endfor %}

// Builds reference data (maybe not necessary for us, to check)
var store = [
{%- for text in site.documents %}
    {
	"title":  {{ text.title | jsonify }},
	"author": {{ text.author | jsonify }},
	"layout": {{ text.layout | jsonify }},
	"link":   {{ text.url | jsonify }},
    }
{%- unless forloop.last %},{% endunless %}{% endfor %}
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
	var searchitem = '<div class="result"><p><a href="{{ site.baseurl }}'+store[ref].link+'?q='+query+'">'+store[ref].title+'</a></p></div>';
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
