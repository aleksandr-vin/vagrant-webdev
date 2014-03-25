class nodejs {
  # Install prerequirements for nodejs
  package { "python-software-properties":
    ensure => latest,
  }

  package { "python":
    ensure => latest,
  }

  package { "g++":
    ensure => latest,
  }

  package { "make":
    ensure => latest,
  }

  # Add nodejs repo
  apt::ppa { "ppa:chris-lea/node.js": 
    require => [ Package["make"], 
                 Package["python-software-properties"], 
                 Package["g++"], 
                 Package["python"] ]
  }

  package { "nodejs":
    ensure => latest,
    require => Apt::Ppa["ppa:chris-lea/node.js"]
  }
}