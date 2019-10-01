
hostname=$(shell hostname)

LBU_BACKUPDIR=/etc/apk/cache/config-backups

apkovl.tar.gz:
	tar czf apkovl.tar.gz etc root boot


commit:
	echo TODO: Check if tree is clean
	
	lbu commit -d
	tar xf $(LBU_BACKUPDIR)/$(hostname).apkovl.tar.gz
	git status


tarball:
	git diff-index HEAD
	tar ocf ../git.apkovl.tar.gz .



#======= initrd.apkovl style =======
#initrd-pidac:
#	./apkovl.sh pidac
