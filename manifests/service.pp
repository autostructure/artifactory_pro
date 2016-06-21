# == Class artifactory_pro::service
#
# This class is meant to be called from artifactory_pro.
# It ensure the service is running.
#
class artifactory_pro::service {

  service { $::artifactory_pro::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
