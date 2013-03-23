class ssh-server {
        package { 'openssh-server': }

	service { 'sshd':
		ensure => true,
		enable => true,
	}

	group { 'sshusers':
		ensure => 'present',
	}

	file { '/etc/ssh/sshd_config':
		source => 'puppet:///modules/ssh-server/etc/ssh/sshd_config',
	}
}
