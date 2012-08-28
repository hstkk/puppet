class e2 {
	$init = [ 'setpci -s 00:02.0 F4.b=00', 'ntpd -qg &' ]
	file { '/etc/rc.local':
		content => template('e2/etc/rc.local.erb'),
	}
}
