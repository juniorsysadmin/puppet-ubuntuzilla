source ENV['GEM_SOURCE'] || "http://rubygems.org"

group :development, :unit_tests do
  gem 'rake',                   :require => false
  gem 'rspec-puppet',           :require => false
  gem 'puppetlabs_spec_helper', :require => false
  gem 'puppet-lint',            :require => false
  gem 'puppet_facts',           :require => false
  gem 'json',                   :require => false
  gem 'metadata-json-lint',     :require => false
end

group :system_tests do
  gem 'travis',               :require => false
  gem 'travis-lint',          :require => false
  gem 'beaker-rspec',         :require => false
  gem 'minitest', '~> 4.7.5', :require => false
  gem 'vagrant-wrapper',      :require => false
  gem 'guard-rake',           :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
	  gem 'facter', facterversion, :require => false
else
	  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
	  gem 'puppet', puppetversion, :require => false
else
	  gem 'puppet', :require => false
end

# vim:ft=ruby
