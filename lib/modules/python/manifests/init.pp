class python {
  
  package { ["python-pip"]:
    ensure => latest,
    require => Exec["apt-get-update"]
  }

  installtools::install_pkg_pip {
    "ipython":
    pkgname => "ipython",
    module_to_test_import => "IPython";
  }


  installtools::install_pkg_pip {
    "virtualenvwrapper":
    pkgname => "virtualenvwrapper",
    module_to_test_import => "virtualenvwrapper";
  }
  
  # set up virtualenvwrapper
  exec {  "postinstall-virtualenvwrapper":
    command => "echo \"export WORKON_HOME=~/.virtualenvs\" | cat >> ~/.bashrc && echo \"source /usr/local/bin/virtualenvwrapper.sh\" | cat >> ~/.bashrc",
    creates => "/usr/local/bin/virtualenvwrapper.sh",
    path => ["/bin", "/usr/bin"],
  }

  installtools::install_pkg_pip {
    "yolk":
    pkgname => "yolk",
    module_to_test_import => 'yolk';
  }
}
