class installtools {
  define install_pkg ($pkgname, $extra_easy_install_args = "", $module_to_test_import) {
    exec {
     "InstallPkg_$pkgname":
     command => "easy_install $extra_easy_install_args $pkgname",
     unless => "python -c 'import $module_to_test_import'",
     path => ["/bin", "/usr/bin"],
    }
   }

   define install_pkg_pip ($pkgname, $version = "", $module_to_test_import) {
     exec {
      "InstallPkgPip_$pkgname":
      command => "pip install $pkgname $version",
      unless => "python -c 'import $module_to_test_import'",
      path => ["/usr/bin","/usr/local/bin"],
      require => Package["python-pip"]
     }
    }
}