class git-server::repos {
	vcsrepo { '/home/git/opinnaytetyo':
		owner   => 'git',
		group   => 'git',
		ensure   => bare,
		provider => git,
		require  => User['git'],
	}
}
