class puppet {
	$package = 'puppet'
	package { $package:
		ensure => installed
	}

	file { '/etc/puppet.conf':
		ensure  => file,
		source  => 'puppet:///modules/puppet/etc/puppet.conf',
		owner   => 'root',
		group   => 'root',
		mode    => '0444',
		require => Package[$package]
	}

	$init = 'puppet agent --test'
	file { '/etc/rc.local':
		ensure  => file,
		content => template('puppet/etc/rc.local.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => '0444',
		require => Package[$package]
	}
}
