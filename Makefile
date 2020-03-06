export SHELL=/bin/sh
PYTEST := python:3-alpine
ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
ARGS := -h

.PHONY: test

make:
	docker pull $(PYTEST)
	docker tag $(PYTEST) local/pytest

test:
	docker run -it --rm \
		--workdir /opt/bin \
		--entrypoint ./entrypoint.sh \
		--volume `pwd`:/opt/bin:ro \
			$(PYTEST)
