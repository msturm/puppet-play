# Installs play 2.
# Usage
#    include play 

class play {
  require homebrew
  $version = '2.1.0-boxen1' 
  homebrew::formula { "play":
    before => Package["boxen/brews/play"],
    source => "puppet:///modules/play/brews/play.rb"
  }

  Package { "boxen/brews/play":
    ensure => "${version}",
  }

  file { "${boxen::config::homebrewdir}/bin/play2":
    ensure => 'link',
    target => "${boxen::config::homebrewdir}/Cellar/play/${version}/bin/play",
  }
}

