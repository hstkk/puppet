class init {
	file { '/etc/rc.local':
		content => template('init/etc/rc.local.erb'),
		mode   => 500,
	}

	$stop = [ 'avahi-daemon', 'bluetooth', 'ufw' ]
	service { $stop: }
}
