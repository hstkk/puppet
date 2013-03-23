class dev::java {
	package { 'eclipse': }

	$path = '/tmp/repo-deb-build-0002.deb'

	exec { 'download-typesafe':
		cwd => '/tmp',
		command => 'wget http://apt.typesafe.com/repo-deb-build-0002.deb',
		creates => $path,
	}

	package { 'typesafe':
		ensure => held,
		provider => dpkg,
		source   => $path,
		require  => Exec['download-typesafe'],
	}

	exec { 'apt-get update':
		require  => Package['typesafe'],
	}

	package { 'typesafe-stack':
		require  => Exec['apt-get update'],
	}
}
