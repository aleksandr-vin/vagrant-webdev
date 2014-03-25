Exec { path => "/usr/bin" }

#### Update packages ##########################################################
stage { 'preinstall':
  before => Stage['main']
}
class apt_get_update {
  exec { 'apt-get -y update': }
}
class { 'apt_get_update':
  stage => preinstall
}

#### Install interpritators ###################################################
#class { 'webdev-ruby': }
class { 'webdev-python': }