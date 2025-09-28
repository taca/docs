.PHONY: build

#MANUAL_SITE=https://docs.contao.org
MANUAL_SITE=https://www.contaocms.jp

build: build-dev build-manual

# Build a single documentation
build-dev:
	cd page; hugo \
		--cleanDestinationDir \
		--environment dev \
		--destination ../build/dev \
		--logLevel info \
		--baseURL ${MANUAL_SITE}/4.x/dev/ \
		--minify

build-manual:
	cd page; hugo \
		--cleanDestinationDir \
		--environment manual \
		--destination ../build/manual \
		--logLevel info \
		--baseURL ${MANUAL_SITE}/4.x/manual/ \
		--minify

# Start a live reload server
live-dev:
	cd page; hugo server \
		--cleanDestinationDir \
		--environment dev \
		--destination ../build/dev \
		--logLevel info

live-manual:
	cd page; hugo server \
		--cleanDestinationDir \
		--environment manual \
		--destination ../build/manual \
		--logLevel info

clean:
	rm -r build
