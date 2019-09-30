hostname=base

all: tarball

commit:
	lbu commit
	tar xf $(hostname).apkovl.tar.gz
	rm -i $(hostname).apkovl.tar.gz
	git status


tarball:
	git status
