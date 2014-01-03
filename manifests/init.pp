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

  # unlink play with brew, because we want to create our own symlinks
  file { "play2executable":
    path => "${boxen::config::homebrewdir}/bin/play",
    ensure => 'absent',
    require => Package["boxen/brews/play"]
  }
}

