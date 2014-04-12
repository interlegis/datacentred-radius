# == Class: radius::config
#
# Manage the configuration of the radius service
#
class radius::config inherits radius {
  file { $radius::config_file:
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($radius::config_template),
  }
}
