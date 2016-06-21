# == Class artifactory_pro::params
#
# This class is meant to be called from artifactory_pro.
# It sets variables according to platform.
#
class artifactory_pro::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'artifactory_pro'
      $service_name = 'artifactory_pro'
    }
    'RedHat', 'Amazon': {
      $package_name = 'artifactory_pro'
      $service_name = 'artifactory_pro'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
