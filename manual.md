---
layout: page
title: Manual
editor: admin
toc: [background, write, review, publish]
repository: https://github.com/mahrud/proof
---

This manual is based on a documentation written by [Alex Gil](http://laic.columbia.edu/author/2728293031/) with beginners in mind, but has the necessary information for more seasoned conspirators. We will walk through writing a sample blog post titled *The Twisted Cubic*.

## Background

The {{ site.title }} is backed by [Jekyll](https://jekyllrb.com/), the static site generator, and uses the minimal [Ed](https://github.com/minicomp/ed) theme and [$$\KaTeX$$](https://katex.org) for displaying math. The content of the site is hosted on its own GitHub [repository]({{ page.repository }}), so in order to collude you will need a GitHub account. While this process is a bit more involved than Wordpress and other similar tools, the payoff in the long term is worth the effort to learn it.

---

## Write!

Each blog post is written in Markdown and is stored in the [`_posts`]({{ page.repository }}/tree/master/_posts) directory on GitHub. If you are familiar with $$\LaTeX$$ then learning Markdown will be a piece of cake; just open your favorite plain-text editor and start with the front matter:

~~~ yaml
---
layout: post
title: The Twisted Cubic
author: David Hilbert
categories: ["algebraic geometry", "examples"]
date: 1900-01-01
---
~~~

Typically, an easy way to write a new entry is to copy an existing one, replace the content and rename the file. Referring to older entries to remember how to add blockquotes, bibliographies, tables, etc. is also very helpful. Here we go over a few common styling formats:

~~~ markdown
# Section 1

## Subsection 1.1
You can write stuff in _italics_, **bold**, or even ~~strikethrough~~.

Next paragraph should start like this. Do not indent.
~~~

You can use `$$ .. $$` to write mathematical formulas:

~~~ markdown
The function $$\nu$$ is written inline, but can also be in a block:

$$ \nu: \mathbb{P}^{1} \to \mathbb{P}^{3} $$
~~~

To add footnotes, use the following format:

~~~
- O Captain! my Captain! rise up and hear the bells;
- Rise up—for you the flag is flung—for you the bugle[^fn1] trills,

[^fn1]:
	The bugle is a small trumpet implicated in the military industrial complex.
~~~

Looks about ready to submit, so save the file as `the-twisted-cubic.md` to match the title. We will have many chances to perfect it later.

There are two routes for submitting a post:

### Simple

This option is useful if you don't need anything beyond basic Markdown:
- open [`_posts`]({{ page.repository }}/tree/master/_posts)
- click [upload file]({{ page.repository }}/upload/master/_posts)
- upload `the-twisted-cubic.md`
- write a commit title, e.g. `New Entry: The Twisted Cubic`
- choose "Create a **new branch** for this commit and start a pull request"
- write `post/the-twisted-cubic` as the branch name
- click "Propose new file"

This process creates a new [pull request]({{ page.repository }}/pulls), which allows you to keep working on the post.

### Advanced

This method is useful for more involved posts, and a working knowledge of your operating system's terminal is assumed.

First, follow the guide for your operating system [here](https://jekyllrb.com/docs/installation/) to install a Ruby on your computer. Then, using the terminal's `cd` command, switch to the directory where you want to have your writing environment. Once inside the folder, enter the following commands:

~~~ bash
$ git clone {{ page.repository }}.git proof
$ cd proof
$ make install
~~~

If everything works without an error, you can now build a local version of the site by entering:

~~~ bash
$ make serve
~~~

If the site was rendered fine, copy the url from your terminal log and paste it into your browser. This url usually looks something like [`http://127.0.0.1:4000/proof/`](http://127.0.0.1:4000/proof/). At this point you should be looking at your very own working version of the {{ site.title }}.

Once the writing environment is set up:
- save `the-twisted-cubic.md` in the `_posts` directory
- open [`http://127.0.0.1:4000/proof/the-twisted-cubic/`](http://127.0.0.1:4000/proof/the-twisted-cubic/)
- check that everything rendered correctly
- enter the following commands to make a new branch:
~~~ bash
$ git checkout -b post/the-twisted-cubic
$ git add _posts/the-twisted-cubic.md
$ git commit -m "New Entry: The Twisted Cubic"
$ git push origin
~~~
- open [this page]({{ page.repository }}/compare/master...master) in a browser
- change the second drop down menu to `compare: post/the-twisted-cubic`
- make a new pull request

---

## Review

**FIXME**

---

## Publish

**FIXME**

---

If you would like to learn more, use these references to learn more about:
[Ed](https://minicomp.github.io/ed/documentation/),
[basic](https://guides.github.com/features/mastering-markdown/)
[Markdown](https://programminghistorian.org/en/lessons/sustainable-authorship-in-plain-text-using-pandoc-and-markdown),
[GitHub](https://guides.github.com/introduction/flow/) 
[Pages](https://guides.github.com/features/pages/), 
or [Jekyll](https://programminghistorian.org/en/lessons/building-static-sites-with-jekyll-github-pages).

Happy colluding!
