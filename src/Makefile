PREFIX=.


index.html: *.m4 rebuild
	m4 -I . index.m4 > index.html

.PHONY: rebuild
rebuild:


.PHONY: install
install: index.html
	cp index.html $(PREFIX)/
