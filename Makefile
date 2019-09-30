hostname=$(shell hostname)

all: tarball

commit:
	lbu commit -d
	tar xf $(hostname).apkovl.tar.gz
	rm -i $(hostname).apkovl.tar.gz
	git status


tarball:
	git status
