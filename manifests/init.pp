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
         $default_package_name = 'rpcbind'
      case $::lsbdistid {
        'Debian': {
          $default_service_name = 'rpcbind'
        }
        'Ubuntu': {
          $default_service_name = 'rpcbind-boot'
        }
        default: {
          fail("rpcbind on osfamily Debian supports lsbdistid Debian and Ubuntu. Detected lsbdistid is <${::lsbdistid}>.")
        }
      }
    }
    'Suse': {
      if $::lsbmajdistrelease == '10' {
        $default_package_name = 'portmap'
        $default_service_name = 'portmap'
      } else {
      $default_package_name = 'rpcbind'
      $default_service_name = 'rpcbind'
      }
    }
    'RedHat': {
      $default_package_name = 'rpcbind'
      $default_service_name = 'rpcbind'
    }
    default: {
      fail("rpcbind supports osfamilies Debian, RedHat, and Suse. Detected osfamily is <${::osfamily}>")
    }
  }

  if $service_name == 'USE_DEFAULTS' {
    $service_name_real = $default_service_name
  } else {
    $service_name_real = $service_name
  }

  package { 'rpcbind_package':
    ensure => $package_ensure,
    name   => $default_package_name,
  }

  service { 'rpcbind_service':
    ensure  => $service_ensure,
    name    => $service_name_real,
    enable  => $service_enable,
    require => Package['rpcbind_package'],
  }
}
