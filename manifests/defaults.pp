# Global default settings
Package {
	ensure => 'latest'
}

File {
	ensure => 'present',
	owner  => 'root',
	group  => 'root',
	mode   => 444
}

Exec {
	path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
