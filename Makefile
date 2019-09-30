apkovl.tar.gz:
	tar czf apkovl.tar.gz etc root boot


commit:
	lbu commit -d
	tar xf $(hostname).apkovl.tar.gz
	rm -i $(hostname).apkovl.tar.gz
	git status


tarball:
	git diff-index HEAD
	tar cf git.apkovl.tar.gz .



#======= initrd.apkovl style =======
#
#hostname=$(shell hostname)
#initrd-pidac:
#	./apkovl.sh pidac
