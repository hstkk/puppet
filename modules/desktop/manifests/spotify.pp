class desktop::spotify {
	$file = '/etc/apt/sources.list.d/spotify-apt.list'
	file { $file:
		source => 'puppet:///modules/desktop/etc/apt/sources.list.d/spotify-apt.list',
	}

	exec { 'add-public-key':
		command => 'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59',
		require => File[$file],
	}

	exec { 'update':
		command => 'apt-get update',
		require => Exec['add-public-key'],
	}

	package { 'spotify-client':
		require => Exec['update'],
	}
}
