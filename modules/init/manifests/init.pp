class init {
	$stop = [ 'nfs-common', 'portmap' ]
	service { $stop:
		ensure => stopped,
	}
}
