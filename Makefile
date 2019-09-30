#<<<<<<< HEAD
#all: initrd-pidac
#=======
#hostname=$(shell hostname)
#>>>>>>> 9ee4a1d... Makefile

apkovl.tar.gz:
	tar czf apkovl.tar.gz etc root boot


#<<<<<<< HEAD
#initrd-pidac:
#	./apkovl.sh pidac
#=======


commit:
	lbu commit -d
	tar xf $(hostname).apkovl.tar.gz
	rm -i $(hostname).apkovl.tar.gz
	git status


tarball:
	git diff-index HEAD
	tar cf git.apkovl.tar.gz .
