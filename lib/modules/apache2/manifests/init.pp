class apache2 {
  
  package { ["apache2"]:
    ensure => latest,
    require => Exec["apt-get-update"]
  }

  service { "apache2":
    ensure => stopped,
    require => Package["apache2"],
  }
}
