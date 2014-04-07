# == Class: radius::install
#
# Manage the installation of the radius package
#
class radius::install inherits radius {
  package { 'radius':
    ensure => $radius::package_ensure,
    name   => $radius::package_name,
  }
}
