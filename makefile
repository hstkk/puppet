all:
	apt-get install git-core
	apt-get install puppet-common
	git submodule init
	git submodule update
	puppet apply --modulepath=$(CURDIR)/modules manifests/site.pp
