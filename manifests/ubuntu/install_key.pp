# Resource type: datadog_agent::ubuntu::install_key
#
# This resource type install repository keys in Ubuntu
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#
#
define datadog_agent::ubuntu::install_key() {
  $formatted_name = fingerprint_formatter($name)

  exec { "key ${name}":
    command => "/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ${name}",
    unless  => "/usr/bin/apt-key fingerprint | grep -B 1 '${formatted_name}' | grep expires",
  }
}
