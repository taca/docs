

help:
	@echo ""
	@echo "Recommended commands:"
	@echo "	make view-manual		Builds the user manual and starts a local webserver"
	@echo ""
	@echo "Other commands:"
	@echo "	make build			Builds HTML version of all books"
	@echo "	make build-pdf			Builds PDFs for the user manual"
	@echo "	make validate			Builds books and validates for invalid HTML output"
	@echo "	make install			Installs latest GitBook and dependencies"
	@echo ""

view-manual: install
	@node_modules/.bin/gitbook serve ./manual

build: install
	@node_modules/.bin/gitbook build ./manual

build-pdf: install install-python
	@npm install ebook-convert
	@node_modules/.bin/gitbook pdf ./manual ./manual.pdf

install:
	@echo "--> Installing GitBook and plugins..."
	@npm install gitbook-cli
	@node_modules/.bin/gitbook install ./manual
	@rm -rf manual/node_modules/gitbook-plugin-anchorjs
	@git clone -b master https://github.com/aschempp/gitbook-plugin-anchorjs.git manual/node_modules/gitbook-plugin-anchorjs

install-python:
	@echo "--> You must have Python virtualenv"
	@virtualenv python_modules

validate: build install-python
	@python_modules/bin/pip install html5validator
	@python_modules/bin/python2.7 python_modules/bin/html5validator --root manual/_book/ --ignore "gitbook/plugins" "element must have an" "A document must not include both" "Duplicate ID"

deploy: validate build-pdf
