.PHONY: build

#MANUAL_URL=https://docs.contao.org/manual/
MANUAL_URL=https://www.contaocms.jp/manual/

build: build-dev build-manual

# Build a single documentation
build-dev:
	cd page; hugo \
		--cleanDestinationDir \
		--environment dev \
		--destination ../build/dev \
		--logLevel info \
		--baseURL https://docs.contao.org/dev/

build-manual:
	cd page; hugo \
		--cleanDestinationDir \
		--environment manual \
		--destination ../build/manual \
		--logLevel info \
		--baseURL $(MANUAL_URL)

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
