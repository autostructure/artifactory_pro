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
  String $license_key                                                            = $::artifactory_pro::params::license_key,
  String $package_name                                                           = $::artifactory_pro::params::package_name,
  String $service_name                                                           = $::artifactory_pro::params::service_name,
  String $plugins_dir                                                            = $::artifactory_pro::params::plugins_dir,
  Enum['mssql', 'mysql', 'oracle', 'postgresql'] $db_type                        = $::artifactory_pro::params::db_type,
  String                                         $db_url                         = $::artifactory_pro::params::db_url,
  String                                         $db_username                    = $::artifactory_pro::params::db_username,
  String                                         $db_password                    = $::artifactory_pro::params::db_password,
  Enum['filesystem', 'fullDb','cachedFS']        $binary_provider_type           = $::artifactory_pro::params::license_key,
  Optional[Integer]                              $pool_max_active                = $::artifactory_pro::params::pool_max_active,
  Optional[Integer]                              $pool_max_idle                  = $::artifactory_pro::params::pool_max_idle,
  Optional[Integer]                              $binary_provider_cache_maxSize  = $::artifactory_pro::params::binary_provider_cache_maxSize,
  Optional[String]                               $binary_provider_filesystem_dir = $::artifactory_pro::params::binary_provider_filesystem_dir,
  Optional[String]                               $binary_provider_cache_dir      = $::artifactory_pro::params::binary_provider_cache_dir,
) inherits ::artifactory_pro::params {
  contain ::artifactory_pro::yum
  contain ::artifactory_pro::install
  contain ::artifactory_pro::config
  contain ::artifactory_pro::service

Class['::artifactory_pro::yum']     ->
  Class['::artifactory_pro::install'] ->
  Class['::artifactory_pro::config']  ~>
  Class['::artifactory_pro::service']
}
