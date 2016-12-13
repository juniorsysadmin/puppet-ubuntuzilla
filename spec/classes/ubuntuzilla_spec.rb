require 'spec_helper'

describe 'ubuntuzilla', type: :class do
  context 'Debian osfamily with no parameters' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('apt') }
    it do
      is_expected.to contain_apt__source('ubuntuzilla').with(
        'include' => {
          'src' => false
        },
        'key' => {
          'id' => 'C77205F7194A3E1ABE2DF9A4B7B9C16F2667CA5C',
          'server' => 'keyserver.ubuntu.com'
        },
        'location' => 'http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt',
        'release' => 'all',
        'repos'   => 'main'
      )
    end
  end

  context 'Debian with location set' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { 'location' => 'http://mirror.domain.com' } }
    it { is_expected.to contain_apt__source('ubuntuzilla').with_location('http://mirror.domain.com') }
  end

  context 'Debian with release set' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { release: 'other' } }
    it { is_expected.to contain_apt__source('ubuntuzilla').with_release('other') }
  end

  context 'Debian with repos set' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { repos: 'contrib' } }
    it { is_expected.to contain_apt__source('ubuntuzilla').with_repos('contrib') }
  end

  context 'Debian with key set' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { key: 'A1234567' } }
    it do
      is_expected.to contain_apt__source('ubuntuzilla').with(
        'key' => {
          'id'     => 'A1234567',
          'server' => 'keyserver.ubuntu.com'
        }
      )
    end
  end

  context 'Debian with key_server set' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { key_server: 'keyserver.server.domain' } }
    it do
      is_expected.to contain_apt__source('ubuntuzilla').with(
        'key' => {
          'id'     => 'C77205F7194A3E1ABE2DF9A4B7B9C16F2667CA5C',
          'server' => 'keyserver.server.domain'
        }
      )
    end
  end

  context 'Debian with include_src set to true' do
    let(:facts) { { lsbdistid: 'debian', lsbdistcodename: 'wheezy', osfamily: 'Debian' } }
    let(:params) { { include_src: true } }
    it do
      is_expected.to contain_apt__source('ubuntuzilla').with(
        'include' => {
          'src' => true
        }
      )
    end
  end

  context 'Non-Debian osfamily' do
    let(:facts) { { lsbdistid: 'redhat', osfamily: 'RedHat', operatingsystem: 'Fedora' } }
    it { is_expected.to compile.with_all_deps }
  end
end
