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
  String $license_key,
  String $yum_name                                                        = 'bintray-jfrog-artifactory-pro-rpms',
  String $yum_baseurl                                                     = 'https://jfrog.bintray.com/artifactory-pro-rpms',
  Optional[Enum['mssql', 'mysql', 'oracle', 'postgresql']] $db_type       = undef,
  Optional[Integer] $db_port                                              = undef,
  Optional[String] $db_hostname                                           = undef,
  Optional[String] $db_username                                           = undef,
  Optional[String] $db_password                                           = undef,
  Optional[Enum['filesystem', 'fullDb','cachedFS']] $binary_provider_type = undef,
  Optional[Integer] $pool_max_active                                      = undef,
  Optional[Integer] $pool_max_idle                                        = undef,
  Optional[Integer] $binary_provider_cache_maxSize                        = undef,
  Optional[String] $binary_provider_filesystem_dir                        = undef,
  Optional[String] $binary_provider_cache_dir                             = undef,
) {

  class{'::artifactory':
    license_key                    => $license_key,
    yum_name                       => $yum_name,
    yum_baseurl                    => $yum_baseurl,
    db_type                        => $db_type,
    db_port                        => $db_port,
    db_hostname                    => $db_hostname,
    db_username                    => $db_username,
    db_password                    => $db_password,
    binary_provider_type           => $binary_provider_type,
    pool_max_active                => $pool_max_active,
    pool_max_idle                  => $pool_max_idle,
    binary_provider_cache_maxSize  => $binary_provider_cache_maxSize,
    binary_provider_filesystem_dir => $binary_provider_filesystem_dir,
    binary_provider_cache_dir      => $binary_provider_cache_dir,
  }             ->
  class{'::artifactory_pro::config': } ~>
  Class['::artifactory::service']
}
