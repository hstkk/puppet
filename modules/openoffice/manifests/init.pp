class openoffice {
        package { 'openoffice.org':
                ensure => installed
        }

	package { 'openoffice.org-l10n-fi':
		ensure => installed
	}
}
