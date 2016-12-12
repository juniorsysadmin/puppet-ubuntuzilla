require 'spec_helper'

describe 'ubuntuzilla', :type => :class do

  context 'Debian osfamily with no parameters' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    it { should compile.with_all_deps }
    it { should contain_class('apt') }
    it { should contain_apt__source('ubuntuzilla').with_location('http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt') }
    it { should contain_apt__source('ubuntuzilla').with_release('all') }
    it { should contain_apt__source('ubuntuzilla').with_repos('main') }
    it { should contain_apt__source('ubuntuzilla').with_key('C77205F7194A3E1ABE2DF9A4B7B9C16F2667CA5C') }
    it { should contain_apt__source('ubuntuzilla').with_key_server('keyserver.ubuntu.com') }
    it { should contain_apt__source('ubuntuzilla').with_include_src(false) }
  end

  context 'Debian with location set' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ 'ubuntuzilla_location' => 'http://mirror.domain.com' }}
    it { should contain_apt__source('ubuntuzilla').with_location('http://mirror.domain.com') }
  end

  context 'Debian with release set' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ :ubuntuzilla_release => 'other' }}
    it { should contain_apt__source('ubuntuzilla').with_release('other') }
  end

  context 'Debian with repos set' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ :ubuntuzilla_repos => 'contrib' }}
    it { should contain_apt__source('ubuntuzilla').with_repos('contrib') }
  end

  context 'Debian with key set' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ :ubuntuzilla_key => 'A1234567' }}
    it { should contain_apt__source('ubuntuzilla').with_key('A1234567') }
  end

  context 'Debian with key_server set' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ :ubuntuzilla_key_server => 'keyserver.server.domain' }}
    it { should contain_apt__source('ubuntuzilla').with_key_server('keyserver.server.domain') }
  end

  context 'Debian with include_src set to true' do
    let(:facts) {{ :lsbdistid => 'debian', :lsbdistcodename => 'wheezy', :osfamily => 'Debian', }}
    let(:params) {{ :ubuntuzilla_include_src => true }}
    it { should contain_apt__source('ubuntuzilla').with_include_src(true) }
  end

  context 'Non-Debian osfamily' do
    let(:facts) {{ :lsbdistid => 'redhat', :osfamily => 'RedHat', :operatingsystem => 'Fedora', }}
    it { should compile.with_all_deps }
  end
end
