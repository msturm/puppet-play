# Installs play 2.
# Usage
#    include play 

class play {
  require homebrew
  $version = "2.1.1-boxen1" 

  homebrew::formula { "play":
    before => Package["boxen/brews/play"],
    source => "puppet:///modules/play/brews/play.rb",
  }

  package { "boxen/brews/play":
    ensure => "${version}",
  }

  file { "${boxen::config::homebrewdir}/bin/play2":
    ensure => 'link',
    target => "../Cellar/play/${version}/bin/play",
  }

  file { "${boxen::config::homebrewdir}/bin/play21":
    ensure => 'link',
    target => "../Cellar/play/${version}/bin/play",
  }

  file { "${boxen::config::homebrewdir}/bin/play211":
    ensure => 'link',
    target => "../Cellar/play/${version}/bin/play",
  }

  # this should not be necessary anymore since we changed the formula
  # unlink play with brew, because we want to create our own symlinks
  #exec { "${boxen::config::homebrewdir}/bin/brew unlink play":
  #  require => Package["boxen/brews/play"]
  #}
}

