# Class: artifactory_pro
# ===========================
#
# Full description of class artifactory_pro here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class artifactory_pro (
  $package_name = $::artifactory_pro::params::package_name,
  $service_name = $::artifactory_pro::params::service_name,
) inherits ::artifactory_pro::params {

  # validate parameters here

  class { '::artifactory_pro::install': } ->
  class { '::artifactory_pro::config': } ~>
  class { '::artifactory_pro::service': } ->
  Class['::artifactory_pro']
}
