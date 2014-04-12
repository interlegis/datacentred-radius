# == Class: radius::params
#
# Default paramaters for different operating systems, etc
#
class radius::params {

  $package_ensure  = 'present'
  $service_enable  = true
  $service_ensure  = 'running'
  $service_manage  = true
  $config_template = 'radius/radiusd.conf.erb'

  case $::osfamily {
    'Debian': {
      $package_name = ['freeradius']
      $service_name = 'freeradius'
      $config_file  = '/etc/freeradius/radiusd.conf'
    }
    default: {
      fail("${::module_name} is not supported on ${::operatingsystem}.")
    }
  }

}
