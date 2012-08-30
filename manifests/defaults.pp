# Global default settings

$server = 'srv.local'
$distro = 'precise'
$init = [ 'puppet agent --test' ]

Package {
	ensure => latest,
	provider => aptitude,
}

filebucket { 'main':
	server => $server,
	path   => false,
}

File {
	ensure => file,
	owner  => 'root',
	group  => 'root',
	mode   => 444,
	backup => main,
}

Exec {
	path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}

Service {
	ensure => false,
	enable => false,
}
