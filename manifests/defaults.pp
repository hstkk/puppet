# Global default settings

$server = 'srv.local'
$distro = 'squeeze'

Package {
	ensure => 'latest',
}

Filebucket { 'main':
	server => puppet,
	path   => false,
}

File {
	ensure => 'file',
	owner  => 'root',
	group  => 'root',
	mode   => 444,
	backup => main,
}

Exec {
	path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
