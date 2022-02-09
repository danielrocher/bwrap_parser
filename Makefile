all: build

clean:
	find . -name \*.pyc -type f -delete
	find . -name __pycache__ -type d -delete

build: build_python

build_python:
	py3compile *.py
	py3compile include/*.py

install: install_program install_profiles

install_program: build_python
	mkdir -p /opt/bwrap_parser
	cp -P *.py /opt/bwrap_parser/
	cp -Pr __pycache__ /opt/bwrap_parser/
	cp -Pr includes /opt/bwrap_parser/
	chown root:root /opt/bwrap_parser -R && chmod +r /opt/bwrap_parser -R
	echo '#!/bin/sh\ncd /opt/bwrap_parser/\n/opt/bwrap_parser/bwrap_parser.py $$*\n' > /usr/local/bin/bwrap_parser
	chmod 755 /usr/local/bin/bwrap_parser

install_profiles:
	mkdir -p /opt/bwrap_parser
	cp -Pr profiles /opt/bwrap_parser/

uninstall:
	rm -rf /opt/bwrap_parser/
	rm -f /usr/local/bin/bwrap_parser
