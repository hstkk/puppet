class xfce {
        package { 'xorg':
                ensure => installed
        }

	package { 'xfce4':
		ensure => installed
	}

        package { 'network-manager-gnome':
                ensure => installed
        }

        package { 'xfce4-notifyd':
                ensure => installed
        }

	package { 'xfce4-terminal':
		ensure => installed
	}
}
