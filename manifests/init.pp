# == Class: rpcbind
#
# Manage rpcbind
#
class rpcbind (
  $package_ensure = 'installed',
  $package_name   = 'USE_DEFAULTS',
  $service_enable = true,
  $service_ensure = 'running',
  $service_name   = 'USE_DEFAULTS',
) {

  case $::osfamily {
    'Debian': {
      case $::lsbdistid {
        'Debian': {
          $default_service_name = 'rpcbind'
          $default_package_name   = 'rpcbind'
        }
        'Ubuntu': {
          $default_service_name = 'rpcbind-boot'
          $default_package_name   = 'rpcbind'
        }
        default: {
          fail("rpcbind on osfamily Debian supports lsbdistid Debian and Ubuntu. Detected lsbdistid is <${::lsbdistid}>.")
        }
      }
    }
    'Suse': {
      $default_service_name = 'rpcbind'
      $default_package_name = 'rpcbind'
    }
    'RedHat': {
      $default_service_name = 'rpcbind'
      $default_package_name = 'rpcbind'
    }
    'Solaris': {
      $default_service_name = 'rpc/bind'
      $default_package_name = ['SUNWcsu',
                                'SUNWcsr']
    }
    default: {
      fail("rpcbind supports osfamilies Debian, Suse, RedHat and Solaris. Detected osfamily is <${::osfamily}>")
    }
  }

  if $service_name == 'USE_DEFAULTS' {
    $service_name_real = $default_service_name
  } else {
    $service_name_real = $service_name
  }

  if $package_name == 'USE_DEFAULTS' {
    $package_name_real = $default_package_name
  } else {
    $package_name_real = $package_name
  }

  package { 'rpcbind_package':
    ensure => $package_ensure,
    name   => $package_name_real,
  }

  service { 'rpcbind_service':
    ensure  => $service_ensure,
    name    => $service_name_real,
    enable  => $service_enable,
    require => Package['rpcbind_package'],
  }
}
