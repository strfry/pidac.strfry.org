all: initrd-pidac

apkovl.tar.gz:
	tar czf apkovl.tar.gz etc root boot

initrd-pidac:
	./apkovl.sh pidac
