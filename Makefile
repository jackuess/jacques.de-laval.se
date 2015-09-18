IMAGE_NAME=jacques.de-laval.se
PORT=8080
DEBUG_PORT=8000
DOCKER_CMD=$(shell which docker)
START_CMD=$(DOCKER_CMD) run --name $(IMAGE_NAME) -d -p $(PORT):80 $(IMAGE_NAME)
STOP_CMD=$(DOCKER_CMD) stop $(IMAGE_NAME) ; $(DOCKER_CMD) rm $(IMAGE_NAME)
SYSTEMD_SERVICE_FILE=jacques.de-laval.se.service

.PHONY: docker_image
docker_image:
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run: docker_image
	$(START_CMD)

.PHONY: run-interactive
run-interactive: docker_image
	docker run -ti --rm $(IMAGE_NAME) /bin/bash

.PHONY: stop-and-remove
stop-and-remove:
	$(STOP_CMD)

.PHONY: run-debug
run-debug:
	mkdir -p /tmp/$(IMAGE_NAME)-$(USER)
	$(MAKE) -C src/
	$(MAKE) -C src/ install PREFIX=/tmp/$(IMAGE_NAME)-$(USER)
	./debug-serve.sh /tmp/$(IMAGE_NAME)-$(USER)/index.html $(DEBUG_PORT)

$(SYSTEMD_SERVICE_FILE):
	m4 -DSTART_CMD="$(START_CMD)" \
	   -DSTOP_CMD="$(STOP_CMD)" \
	   $(SYSTEMD_SERVICE_FILE).m4 > $(SYSTEMD_SERVICE_FILE)

.PHONY: install
install: docker_image $(SYSTEMD_SERVICE_FILE)
	install -m 0644 $(SYSTEMD_SERVICE_FILE) /etc/systemd/system/
