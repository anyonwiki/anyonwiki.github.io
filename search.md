---
layout: page
title: Search
---

<form id="x-search" role="search">
  In case you don't want to use the search box provided by your browser:
  <br />
  <input id="x-search-query" type="text" name="q" />
</form>


<div id="results"></div>
<ul id="search_results"></ul>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
  integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/elasticlunr@0.9.5/elasticlunr.min.js"
  integrity="sha256-cUqUYjN4U6JfE3pqo/8aqbyS/Y3T0dNljhd+R1wGUYE=" crossorigin="anonymous"></script>
<script src="{{site.baseurl}}/static/search.js"></script>

<!--	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/elasticlunr@0.9.5/elasticlunr.min.js"
  integrity="sha256-cUqUYjN4U6JfE3pqo/8aqbyS/Y3T0dNljhd+R1wGUYE=" crossorigin="anonymous"></script>
<script src="{{site.baseurl}}/static/search.js"></script>
-->
