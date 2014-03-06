class raspberrypi::gateway {
	raspberrypi::user { 'gateway': }
	
	User <| title == gateway |> {
		groups  +> ['sshusers'],
		require => Group['sshusers'],
	}

	ssh_authorized_key { 'docker'
		key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC4kOSkYY/10NHVg5OO8o7JIjm601KQ+7clfHYtOpvnMgnGrlb/nqboldELN7W+KXuZulanvbHz6pqLOMYAfXI8qhFuVB+345kLterwU7p20TquUptHWEpvsq++76YtfbLdBM0sBKKb+XXWsuorSYV+XqNp5SeJgOC52aNSRyt+NiUH++tiDDnJPNm7JqLpCSzxXRWGg3+qw26OB/Mclv3uSpNkBK2nsw+pZqXLUd+KrOljCJcVrr/7f01zemNSMQqLdfyXmcmeyV2DBZxsRDDUUnPRBgJOiiUApPFGLljAy68x7OHzHAAxDAjImPQBvNJG2hrHRhz/iGn8iWBk6/a5',
		ensure  => present,
		type    => 'ssh-rsa',
		user    => 'gateway',
		require => User['gateway'],
	}
}
