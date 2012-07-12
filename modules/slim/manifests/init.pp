class slim {
        service { 'slim':
                ensure => running,
                require => Package['slim']
        }

        package { 'slim':
                ensure => installed
        }
}
