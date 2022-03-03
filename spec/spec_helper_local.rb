def platforms
  {
    'debian9' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Debian',
          :os => {
            'name' => 'Debian',
            'family' => 'Debian',
            'release' => {
              'full'  => '9.0',
              'major' => '9',
              'minor' => '0'
            },
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'debian10' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Debian',
          :os => {
            'name' => 'Debian',
            'family' => 'Debian',
            'release' => {
              'full'  => '10.0',
              'major' => '10',
              'minor' => '0'
            },
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'el7' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '7',
          :os => {
            :name => 'RedHat',
            :family => 'RedHat',
            :release => {
              :full  => '7.0.1406',
              :major => '7',
              :minor => '0'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'el8' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '8',
          :os => {
            :name => 'RedHat',
            :family => 'RedHat',
            :release => {
              :full  => '8.0.1905',
              :major => '8',
              :minor => '0'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'el9' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '9',
          :os => {
            :name => 'RedHat',
            :family => 'RedHat',
            :release => {
              :full  => '9.0',
              :major => '9',
              :minor => '0'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'suse15' =>
      {
        :facts_hash => {
          :osfamily => 'Suse',
          :operatingsystem => 'SLES',
          :operatingsystemmajrelease => '15',
          :os => {
            'name' => 'SLES',
            'family' => 'Suse',
            'release' => {
              'full'  => '15.1',
              'major' => '15',
              'minor' => '1'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'ubuntu1804' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '18.04',
              'major' => '18.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'ubuntu2004' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '20.04',
              'major' => '20.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
  }
end
