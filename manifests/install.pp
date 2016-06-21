# == Class artifactory_pro::install
#
# This class is called from artifactory_pro for install.
#
class artifactory_pro::install {

  package { $::artifactory_pro::package_name:
    ensure => present,
  }
}
