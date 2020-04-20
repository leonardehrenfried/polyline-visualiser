SHELL := /bin/bash
DEST := /home/lenni/www/
DATE := $(shell date "+%Y%m%d%H%M%S")

deploy:
	rsync -rC \
		-e "ssh" --rsync-path="sudo rsync" \
		`pwd` \
		lenni@leonard.io:${DEST}
	ssh lenni@leonard.io 'sudo chown www-data:www-data -R ${DEST}'

watch:
	ag -l | entr make deploy


