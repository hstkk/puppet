class iceweasel {

	$file = '/tmp/iceweasel.sh'
	$deb  = '/tmp/pkg-mozilla-archive-keyring_1.0_all.deb'
	$url  = 'http://mozilla.debian.net/pkg-mozilla-archive-keyring_1.0_all.deb'

	file { $file:
		ensure => present,
		content => template('iceweasel/tmp/iceweasel.sh.erb'),
		mode   => 555,
	}

	exec { 'sh /tmp/iceweasel.sh':
		onlyif => 'test -f /tmp/iceweasel.sh'
	}

	file { $file:
		ensure => absent,
	}
}
