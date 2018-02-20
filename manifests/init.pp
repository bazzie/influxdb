# influxdb
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include influxdb
class influxdb(

  Boolean $manage_repo,

){

  include influxdb::install
  include influxdb::config
  include influxdb::service

  Class['influxdb::install']
  -> Class['influxdb::config']
  ~> Class['influxdb::service']

}
