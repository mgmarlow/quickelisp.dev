.PHONY: install watch

install:
	apt install inotify-tools

build:
	emacs -Q --script publish.el

watch:
	while true; do \
		inotifywait -qr -e modify -e create -e delete -e move pages/*.org; \
		make build; \
	done

serve:
	npx wrangler pages dev

publish:
	npx wrangler pages deploy output/
