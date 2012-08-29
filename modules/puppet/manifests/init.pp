class puppet {
	$package = 'puppet'
	package { $package: }

	file { '/etc/puppet/puppet.conf':
		content => template('puppet/etc/puppet/puppet.conf.erb'),
		require => Package[$package],
	}
}
