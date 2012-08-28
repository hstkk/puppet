class ntp {
	$package = 'ntp'
	package { $package: }

	file { '/etc/ntp.conf':
		source => 'puppet:///modules/ntp/etc/ntp.conf',
		require => Package[$package],
	}
}
