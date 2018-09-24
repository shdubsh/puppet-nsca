# = Class: nsca::client
#
# Sets up an NSCA client to send passive check results
# to icinga
class nsca::client {
    ensure_packages('nsca-client')

    # TODO: needs passwords module
    # include ::passwords::icinga
    # $nsca_decrypt_password = $::passwords::icinga::nsca_decrypt_password
    $nsca_decrypt_password = 'placeholder'

    file { '/etc/send_nsca.cfg':
        content => template("${module_name}/nsca-client.cfg.erb"),
        owner   => 'root',
        mode    => '0400',
        require => Package['nsca-client'],
    }
}
