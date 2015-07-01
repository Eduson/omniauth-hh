# -*- encoding: utf-8 -*-
# stub: omniauth-hh 0.1.18 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-hh"
  s.version = "0.1.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "TODO: Set to 'http://mygemserver.com'" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Mark Volosiuk"]
  s.bindir = "exe"
  s.date = "2015-07-01"
  s.description = "OmniAuth strategy for hh. Website: dev.hh.ru"
  s.email = ["marchi.martius@gmail.com"]
  s.files = [".gitignore", ".rspec", ".travis.yml", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "bin/console", "bin/setup", "lib/omniauth-hh.rb", "lib/omniauth-hh/version.rb", "lib/omniauth/strategies/hh.rb", "omniauth-hh.gemspec"]
  s.homepage = "https://github.com/marchi-martius/omniauth-hh"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "OmniAuth strategy for hh"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.3"])
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.3"])
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
