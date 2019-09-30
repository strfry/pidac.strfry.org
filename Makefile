hostname=$(shell hostname)

all: tarball

commit:
	lbu commit -d
	tar xf $(hostname).apkovl.tar.gz
	#rm -i $(hostname).apkovl.tar.gz
	git add -p
	git commit -a


tarball:
	git diff-index HEAD
	tar cf git.apkovl.tar.gz .
