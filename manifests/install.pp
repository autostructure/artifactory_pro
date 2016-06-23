# == Class artifactory::install
#
# This class is called from artifactory for install.
#
class artifactory_pro::install {
  package { $::artifactory_pro::package_name:
    ensure  => present,
  }
}
