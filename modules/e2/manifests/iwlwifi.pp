class e2::iwlwifi {
        package { 'firmware-iwlwifi':
                ensure => installed
        }

        package { 'wireless-tools':
                ensure => installed
        }
}
