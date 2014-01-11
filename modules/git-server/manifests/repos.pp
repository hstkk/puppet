class git-server::repos {
	vcsrepo { '/home/git/opinnaytetyo':
		ensure   => bare,
		provider => git,
	}
}
