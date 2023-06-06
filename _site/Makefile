all: serve

check: build
	bundle exec htmlproofer ./_site/ --only-4xx --check-html --disable-external --empty-alt-ignore # --check-favicon

serve:
	bundle exec jekyll serve -d _site/proof/

build:
	rm -rf _site
	bundle exec jekyll build -d _site/proof/

install:
	gem install jekyll
	gem install bundler
	bundle config set path 'vendor/bundle'
	bundle install
