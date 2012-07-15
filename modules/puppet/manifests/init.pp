class puppet {
	$package = 'puppet'
	package { $package:
	}

	file { '/etc/puppet.conf':
		content => template('puppet/etc/puppet/puppet.conf.erb'),
		require => Package[$package],
	}

	$init = 'puppet agent --test'
	file { '/etc/rc.local':
		content => template('puppet/etc/rc.local.erb'),
		require => Package[$package],
	}
}
