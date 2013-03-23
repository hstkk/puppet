# Global default settings

$distro = 'quantal'

Package {
	ensure => latest,
	provider => aptitude,
}

File {
	ensure => file,
	owner  => 'root',
	group  => 'root',
	mode   => 444,
}

Exec {
	path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}

Service {
	ensure => false,
	enable => false,
}
