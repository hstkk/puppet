class apt_conf {
	$file = '/etc/apt/sources.list'

	file { $file:
		content => template('apt_conf/sources.list.erb');
	}

	exec { 'aptitude update':
		command => '/usr/bin/aptitude update',
		subscribe   => File[$file],
		refreshonly => true
	}
}
