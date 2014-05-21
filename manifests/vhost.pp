# == Definition: radius::vhost
#
# Install a radius vhost
#
define radius::vhost (
) {

  # The base class must be included first because it is used by parameter defaults
  if ! defined(Class['radius']) {
    fail('You must include the radius base class before using any radius defined resources')
  }

  # Define the vhost in sites-available
  file { "${::radius::config}/sites-available/${name}":
    content => template('radius/vhost.erb'),
  }

  # Symlink the site if it's enabled
  $vhost_symlink_ensure = $ensure ? {
      present => link,
      default => $ensure,
  }

  file { "${::radius::config}/sites-enabled/${name}":
    ensure  => $vhost_symlink_ensure,
    target  => "${::radius::config}/sites-available/${name}",
    notify  => Service['radius'],
  }

}
