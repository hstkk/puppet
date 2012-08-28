class sami {
	user { 'sami':
		ensure => present,
	}

	File {
		owner  => 'sami',
		group  => 'sami',
		mode   => 600,
	}

	file { '/home/sami/.gitconfig':
		source => 'puppet:///modules/sami/home/sami/.gitconfig',
	}

	file { '/home/sami/sync':
		ensure => 'directory',
	}

        file { '/home/sami/.bashrc':
		source => 'puppet:///modules/sami/home/sami/.bashrc',
        }

        file { '/home/sami/.ssh/config':
		source => 'puppet:///modules/sami/home/sami/.ssh/config',
        }
}
