class init {
	file { '/etc/rc.local':
		content => template('init/etc/rc.local.erb'),
		mode   => 500,
	}
}
