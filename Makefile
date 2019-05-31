
GBCBASE=$(PWD)

include makefile.inc

BASE=$(shell pwd)
dirs=gbc-gc

all: distbin gbc-current subdirs

distbin:
	mkdir distbin

# Setup the GBC build env
gbc-current: 
	./gbc-setup.sh > gbc-setup.out

subdirs: $(dirs)
	@for dir in $^ ; do  \
		cd $(BASE)/$$dir && make all; \
	done

clean:
	rm $(DISTBIN)/gbc*.zip