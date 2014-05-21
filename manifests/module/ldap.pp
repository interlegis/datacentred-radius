# == Class: radius::mod::ldap
#
# Radius Module - LDAP
#
class radius::module::ldap (
  $server,
  $basedn,
  $filter,
) inherits radius {

  package { 'radius-ldap':
    ensure  => $radius::package_ensure,
    name    => $radius::ldap_module_package_name,
    require => Package['radius'],
  } ->

  file { "${radius::config}/modules/ldap":
    content => template('radius/module/ldap.erb'),
    notify  => Service['radius'],
  }

}
