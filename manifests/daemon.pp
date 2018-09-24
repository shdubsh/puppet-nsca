# = Class: nsca::daemon
#
# Sets up an NSCA daemon for listening to passive check
# results from hosts
class nsca::daemon {

    ensure_packages('nsca')

    # TODO: needs passwords module
    # include ::passwords::icinga
    # $nsca_decrypt_password = $::passwords::icinga::nsca_decrypt_password
    $nsca_decrypt_password = 'placeholder'

    file { '/etc/nsca.cfg':
        content => template("${module_name}/nsca-server.cfg.erb"),
        owner   => 'root',
        mode    => '0400',
        require => Package['nsca'],
    }

    service { 'nsca':
        ensure  => running,
        require => File['/etc/nsca.cfg'],
    }
}
