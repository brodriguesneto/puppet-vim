# Class: vim::install
class vim::install {
  package { $vim::params::package:
    ensure => $vim::package_ensure,
    before => Class['vim::config']
  }
}
