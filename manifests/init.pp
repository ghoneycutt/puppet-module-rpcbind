# @summary rpcbind class
#
# Manages rpcbind package and service.
#
# @example Declaring the class
#   include rpcbind
#
# @param package_ensure Value used for the ensure attribute of the rpcbind package resource.
# @param package_name Value used for the name attribute of the rpcbind package resource.
# @param service_enable Boolean used for the enable attribute of the rpcbind service resource.
# @param service_ensure Value used for the ensure attribute of the rpcbind service resource.
# @param service_name Value used for the name attribute of the rpcbind service resource.
#
class rpcbind (
  String[1] $package_ensure = 'installed',
  String[1] $package_name = 'rpcbind',
  Boolean $service_enable = true,
  String[1] $service_ensure = 'running',
  String[1] $service_name = 'rpcbind',
) {
  if !($facts['os']['family'] in ['Debian','RedHat','Suse']) {
    notice('Unsupported osfamily detected. This module works with Debian, RedHat and Suse')
  }

  if $facts['os']['family'] == 'RedHat' and !($facts['os']['release']['major'] in ['7','8','9']) {
    notice("osfamily RedHat's os.release.major is <${::facts['os']['release']['major']}> and is not supported.")
  } elsif $facts['os']['family'] == 'Suse' and !($facts['os']['release']['major'] in ['15']) {
    notice("osfamily Suse's os.release.major is <${::facts['os']['release']['major']}> and is not supported.")
  } elsif $facts['os']['name'] == 'Debian' and !($facts['os']['release']['major'] in ['9','10']) {
    notice("Ubuntu's os.release.major is <${facts['os']['release']['major']}> and is not supported.")
  } elsif $facts['os']['name'] == 'Ubuntu' and !($facts['os']['release']['major'] in ['18.04','20.04']) {
    notice("Ubuntu's os.release.major is <${facts['os']['release']['major']}> and is not supported.")
  }

  package { 'rpcbind_package':
    ensure => $package_ensure,
    name   => $package_name,
  }

  service { 'rpcbind_service':
    ensure  => $service_ensure,
    name    => $service_name,
    enable  => $service_enable,
    require => Package['rpcbind_package'],
  }
}
