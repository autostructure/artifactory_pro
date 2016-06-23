# == Class artifactory::service
#
# This class is meant to be called from artifactory.
# It ensure the service is running.
#
class artifactory_pro::service {

  service { $::artifactory_pro::service_name :
    ensure => running,
  }
}
