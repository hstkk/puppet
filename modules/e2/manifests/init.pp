class e2 {
	file { '/etc/local.d':
		ensure => 'directory',
	}

	File {
		mode   => 500,
	}

	$startup = [ '/etc/local.d/fix-backlight.sh&', 'ntpd -qg &' ]
	file { '/etc/local.d/startup.sh':
		content => template('e2/etc/local.d/startup.sh.erb'),
	}

	file { '/etc/local.d/fix-backlight.sh':
		source => 'puppet:///modules/e2/etc/local.d/fix-backlight.sh',
	}
}
