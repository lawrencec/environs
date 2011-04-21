class javascript {
  installtools::install_pkg_pip {
    "google-closure-linter":
    pkgname => "http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz",
    module_to_test_import => "closure_linter",
  }
  # Current version (as of 07/04/2011 is flaky on ubuntu 10.x) so commenting out
  # exec {  "nave":
  #   command => "mkdir /home/vagrant/.nave && cd ~/.nave && wget --no-check-certificate https://github.com/isaacs/nave/raw/master/nave.sh && chmod +x /home/vagrant/.nave/nave.sh && sudo ln -s /home/vagrant/.nave/nave.sh /usr/local/bin/nave",
  #   creates => "/home/vagrant/.nave",
  #   path => ["/bin", "/usr/bin"],
  #   user => "vagrant"
  # }
  
  exec {  "jstools-prereq":
    command => "sudo add-apt-repository ppa:jerome-etienne/neoip && sudo apt-get update",
    unless => "ls /etc/apt/sources.list.d/jerome-etienne-neoip-maverick.list",
    path => ["/bin", "/usr/bin"],
    require => Package["python-software-properties"]
  }
  
  package { ["nodejs"]:
    ensure => latest,
    require => Exec["jstools-prereq"]
  }

  package { ["phantomjs"]:
    ensure => latest,
    require => Exec["jstools-prereq"]
  }

}