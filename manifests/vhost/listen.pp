# == Definition: radius::vhost::listen
#
# Install a listen definition into a radius vhost
#
define radius::vhost::listen (
  $vhost,
  $ipaddr,
  $port,
  $type,
) {

  # Path to configuration file
  $config_file = "${radius::config}/sites-available/${vhost}"

  # Add the listener
  concat::fragment{"radius_vhost_${vhost}_listen_${name}":
    target  => $config_file,
    content => template('radius/vhost/_listen.erb'),
  }

}
