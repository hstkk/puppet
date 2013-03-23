class ssh-server {
	$package = 'openssh-server'
        package { $package: }

	service { 'sshd':
		ensure  => true,
		enable  => true,
		require => Package[$package],
	}

	group { 'sshusers':
		ensure => 'present',
	}

	file { '/etc/ssh/sshd_config':
		notify  => Service['sshd'],
		source  => 'puppet:///modules/ssh-server/etc/ssh/sshd_config',
		require => Package[$package],
	}
}
