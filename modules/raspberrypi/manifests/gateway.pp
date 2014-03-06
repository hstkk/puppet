class raspberrypi::gateway {
	raspberrypi::user { 'gateway': }
	
	User <| title == gateway |> {
		groups  +> ['sshusers'],
		require => Group['sshusers'],
	}
}
