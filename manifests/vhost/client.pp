# == Definition: radius::vhost::client
#
# Install a client definition into a radius vhost
#
define radius::vhost::client (
  $vhost,
  $ipaddr,
  $netmask,
  $secret,
) {

  # Path to configuration file
  $config_file = "${radius::config}/sites-available/${vhost}"

  # Add the listener
  concat::fragment{"radius_vhost_${vhost}_client_${name}":
    target  => $config_file,
    content => template('radius/vhost/_client.erb'),
  }

}
