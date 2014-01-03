# Installs play 1.2.7.
# Usage
#    include play::v1_2

class play::v1_2 {
  require homebrew
  $version = '1.2.7-boxen1'

  homebrew::formula { "play12":
    before => Package["boxen/brews/play12"],
    source => "puppet:///modules/play/brews/play12.rb"
  }

  package { "boxen/brews/play12":
    ensure => "${version}",
  }
 
  file { "${boxen::config::homebrewdir}/bin/play1":
    ensure => 'link',
    target => "../Cellar/play12/${version}/bin/play",
  }

  file { "play1executable":
    path => "${boxen::config::homebrewdir}/bin/play",
    ensure => 'absent',
    require => Package["boxen/brews/play12"]
  }
}
