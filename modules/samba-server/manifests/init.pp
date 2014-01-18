class samba-server {
        group { 'smbusers':
                ensure => 'present',
        }


        file { ['/data', '/data/samba', '/data/samba/home']:
                ensure  => 'directory',
        }

        file { '/data/samba/backup':
                ensure  => 'directory',
                group   => 'smbusers',
                mode    => 770,
                require => [File['/data', '/data/samba'], Group['smbusers']],
        }


	class { 'samba::server':
	  workgroup            => 'WORKGROUP',
	  server_string        => '%h server',
	  interfaces           => [ 'lo', 'eth0' ],
	  hosts_allow          => [ '127.0.0.1.', '192.168.1.' ],
	  security             => 'user',
	  map_to_guest         => 'bad user',
	  extra_global_options => [
	    'dns proxy = no',
	    'bind interfaces only = yes',
	    'hosts deny = 0.0.0.0/0',
	    'encrypt passwords = true',
	    'obey pam restrictions = yes',
	    'unix password sync = yes',
	    'passwd program = /usr/bin/passwd %u',
	    'passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .',
	    'pam password change = yes',
	    'guest account = nobody',
	  ],
	  shares => {
            'homes' => [
              'comment = home directories',
              'path = /data/samba/home/%U',
              'browseable = no',
              'read only = no',
              'create mask = 0600',
              'directory mask = 0700',
              'valid users = %S',
            ],
	    'backup' => [
	      'comment = backup',
	      'path = /data/samba/backup',
	      'browseable = no',
	      'read only = no',
	      'create mask = 0600',
	      'directory mask = 0700',
	      'valid users = @smbusers',
	    ],
	  },
	}
}
