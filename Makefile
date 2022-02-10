all: build

clean:
	find . -name \*.pyc -type f -delete
	find . -name __pycache__ -type d -delete

build: build_python

build_python:
	py3compile *.py
	py3compile include/*.py

make_bwrap_parser_directory:
	mkdir -p /opt/bwrap_parser

install: install_program install_profiles

install_program: build_python make_bwrap_parser_directory
	cp -P *.py /opt/bwrap_parser/
	cp -Pr __pycache__ /opt/bwrap_parser/
	cp -Pr includes /opt/bwrap_parser/
	chown root:root /opt/bwrap_parser -R && chmod +r /opt/bwrap_parser -R
	find /opt/bwrap_parser -type d -exec chmod 755 {} \;
	chmod 755 /opt/bwrap_parser/bwrap_parser.py
	test -L /usr/local/bin/bwrap_parser || ln -s /opt/bwrap_parser/bwrap_parser.py /usr/local/bin/bwrap_parser

install_profiles: make_bwrap_parser_directory
	cp -Pr profiles /opt/bwrap_parser/
	chmod 755 /opt/bwrap_parser/profiles
	chmod +r /opt/bwrap_parser/profiles/*

uninstall:
	rm -rf /opt/bwrap_parser/
	rm -f /usr/local/bin/bwrap_parser
