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

  # unlink play with brew, because we want to create our own symlinks
  exec { "${boxen::config::homebrewdir}/bin/brew unlink play12":
    require => Package["boxen/brews/play12"]
  }

  # Remove older version of play12
  file { "${boxen::config::homebrewdir}/Cellar/play12/1.2.5-boxen1":
    ensure => 'absent',
    recurse => 'true'
  }
}
