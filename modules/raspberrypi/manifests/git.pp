class raspberrypi::git {
	Ssh_authorized_key {
		ensure  => present,
		type    => 'ssh-rsa',
		user    => 'git',
		require => User['git'],
	}

	ssh_authorized_key { 'git@one':
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCnhZ7QF5UeQ94eCresZw9OHGtpLRKLYUsQYrgJOQQk3MdVj1h3ofu5F5reFxigjzk+0H60YzjkgCJDg1xK93yaP66JfEweprPfEegc9UAJnWnjU6GbE3NpLwZSU/QoXShK2TunNUbrOUr25U/gCLVe2tdKIU1dDKtHRDrQ6vbzqtKTz+zq0JIFI1fkZzvIyMISH8qFayQbXmgS6m8Zvn/S0oScpRToTgLiqs0rSLtT2sXH5YsJjBC7yenCHo5FclwAw1T6r2NHHfHoSJqSKcCmTCfHgPfl6EfPvDarLVoOeTlY8//PnWh3/uTMq7xfX7Ts5BsDKmBvTCVCX1k91Pcx',
	}

	ssh_authorized_key { 'git@pro':
		key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAuPvtpArbSMtiUr//upPeHky7VG29yFbP8chQAAaWo6rW1Gwxl4ZjZpsxhZKX1xEI3HAXCCwYW9cROL+BVmVVi1YohyCcROpQkloG5mqe+NLkk57+Ed8nWWHpqiEBspVO4v7/bdzQhdAHKNkF45IztyU/IdX/LfIK2RE7YfqlKG0OYtdo3aeCK8TBZuZSsqN/ASfJtV6iouWG6HWX9Q8nZZizi7UCT1WBg7j8vmSv2J5y2SgBRts1VH4CicyyfGPKdFnfLRsFz8UxZORMv6u9qPhys1lnOfNDjpaqv0ETHbp1TXQ7Vj73WPxESIqPPNkidX4o30yUTcmFfkW9swQgeQ==',
	}
}
