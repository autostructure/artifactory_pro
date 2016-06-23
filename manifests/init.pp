# Class: artifactory
# ===========================
#
# Full description of class artifactory here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#

class artifactory_pro(
  String $license_key      = $::artifactory_pro::params::license_key,
  String $package_name     = $::artifactory_pro::params::package_name,
  String $service_name     = $::artifactory_pro::params::service_name,
  String $plugins_dir      = $::artifactory_pro::params::plugins_dir,
) inherits ::artifactory_pro::params {

  class { '::artifactory_pro::yum': }     ->
  class { '::artifactory_pro::install': } ->
  class { '::artifactory_pro::config': }  ~>
  class { '::artifactory_pro::service': } ->
  Class['::artifactory_pro']

}
