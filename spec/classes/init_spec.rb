require 'spec_helper'

describe 'rpcbind' do
  describe 'package resource' do

    context 'with default params on supported osfamily Debian with unsupported lsbdistid' do
      let(:facts) do
        { :lsbdistid => 'Canaima',
          :osfamily => 'Debian',
        }
      end

      it 'should fail' do
        expect {
          should include_class('rpcbind')
        }.to raise_error(Puppet::Error,/rpcbind on osfamily Debian supports lsbdistid Debian and Ubuntu. Detected lsbdistid is <Canaima>./)
      end
    end

    context 'with default params on osfamily Suse' do
      let(:facts) { { :osfamily => 'Suse' } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with default params on osfamily RedHat' do
      let(:facts) { { :osfamily => 'RedHat' } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with default params on Debian' do
      let(:facts) do
        { :lsbdistid => 'Debian',
          :osfamily => 'Debian',
        }
      end

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with default params on Ubuntu' do
      let(:facts) do
        { :lsbdistid => 'Ubuntu',
          :osfamily => 'Debian',
        }
      end

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with default params on osfamily Solaris' do
      let(:facts) { { :osfamily => 'Solaris' } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => ['SUNWcsu', 'SUNWcsr'],
        })
      }
    end

    context 'with ensure absent' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :package_ensure => 'absent' } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'absent',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with supplied string for package name' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :package_name => 'my_rpcbind' } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'my_rpcbind',
        })
      }
    end

    context 'with supplied array for package name' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :package_name => [ 'rpcbind', 'rpcbindfoo', 'rpcbindbar' ] } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => [ 'rpcbind', 'rpcbindfoo', 'rpcbindbar' ],
        })
      }
    end
  end

  describe 'service resource' do
    context 'with default params on osfamily RedHat' do
      let(:facts) { { :osfamily => 'RedHat' } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with default params on Debian' do
      let(:facts) do
        { :lsbdistid => 'Debian',
          :osfamily => 'Debian',
        }
      end

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with default params on Ubuntu' do
      let(:facts) do
        { :lsbdistid => 'Ubuntu',
          :osfamily => 'Debian',
        }
      end

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind-boot',
          'enable' => true,
        })
      }
    end

    context 'with default params on Suse' do
      let(:facts) { { :osfamily => 'Suse' } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with ensure stopped' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :service_ensure => 'stopped' } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'stopped',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with supplied string for service name' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :service_name => 'my_rpcbind' } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'my_rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with default params on osfamily Solaris' do
      let(:facts) do
        { :osfamily => 'Solaris',
        }
      end

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpc/bind',
          'enable' => true,
        })
      }
    end

    context 'with enable false' do
      let(:facts) { { :osfamily => 'RedHat' } }
      let(:params) { { :service_enable => false } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => false,
        })
      }
    end
  end
end
