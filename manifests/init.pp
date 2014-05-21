# == Class: radius
#
# Module to install and manage a radius server
class radius (
  $package_name    = $radius::params::package_name,
  $package_ensure  = $radius::params::package_ensure,
  $service_manage  = $radius::params::service_manage,
  $service_name    = $radius::params::service_name,
  $service_enable  = $radius::params::service_enable,
  $service_ensure  = $radius::params::service_ensure,
) inherits radius::params {

  anchor { 'radius::begin': } ->
  class { '::radius::install': } ->
  class { '::radius::config': } ~>
  class { '::radius::service': } ->
  anchor { 'radius::end': }
}
