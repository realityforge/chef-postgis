name             'postgis'
maintainer       'Peter Donald'
maintainer_email 'peter@realityforge.org'
license          'Apache 2.0'
description      'Installs/Configures postgis Postgresql extension'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

depends 'apt'
depends 'yum'
depends 'postgresql'

supports 'ubuntu'
supports 'fedora'
supports 'centos'
supports 'rhel'
