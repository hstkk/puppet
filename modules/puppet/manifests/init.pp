class puppet {
	$package = 'puppet'
	package { $package: }

	file { '/etc/puppet.conf':
		content => template('puppet/etc/puppet/puppet.conf.erb'),
		require => Package[$package],
	}
}
