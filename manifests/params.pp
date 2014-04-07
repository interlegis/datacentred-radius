# == Class: radius::params
#
# Default paramaters for different operating systems, etc
#
class radius::params {

  $package_ensure = 'present'
  $service_enable = true
  $service_ensure = 'running'
  $service_manage = true

  case $::osfamily {
    'Debian': {
      $package_name = ['freeradius']
      $service_name = 'freeradius'
      $config       = '/etc/freeradius'
    }
    default: {
      fail("The ${::module_name} module is not supported on ${::operatingsystem}.")
    }
  }

}
