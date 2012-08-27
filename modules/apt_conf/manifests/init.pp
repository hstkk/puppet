class apt_conf {
	$file = '/etc/apt/sources.list'

	package { 'aptitude': }

	file { $file:
		content => template('apt_conf/etc/apt/sources.list.erb'),
	}

	exec { 'aptitude update':
		subscribe   => File[$file],
		refreshonly => true,
	}
}
