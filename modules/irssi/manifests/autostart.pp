define irssi::autostart (
	$user = $title,
) {
	cron { "irssi-autostart-${user}":
		command => "tmux new-session -d 'irssi'",
		user    => $user,
		special => 'reboot',
		require => [User[$user], Package[['irssi', 'tmux']]],
	}
}
