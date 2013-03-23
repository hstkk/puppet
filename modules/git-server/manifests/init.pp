class git-server {
	user { 'git':
		ensure => present,
		shell  => '/usr/bin/git-shell',
		groups => ['sshusers'],
	}

	file { '/home/git/.ssh':
		ensure => 'directory',
		owner  => 'git',
		group  => 'git',
	}

        package { 'git-core': }
}
