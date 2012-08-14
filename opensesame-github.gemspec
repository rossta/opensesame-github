# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "opensesame/github/version"

Gem::Specification.new do |s|
  s.name        = "opensesame-github"
  s.version     = OpenSesame::Github::VERSION
  s.authors     = ["Ross Kaffenberger"]
  s.email       = ["rosskaff@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Walled-garden authentication for your github organization}
  s.description = %q{Provide walled-garden authentication to public members of
    your github organization for your rack-based apps with warden and omniauth-github}

  s.rubyforge_project = "opensesame-github"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'warden'
  s.add_dependency 'omniauth-github'
  s.add_dependency 'faraday', '~> 0.8'
  s.add_dependency 'faraday_middleware'

  s.add_development_dependency "rspec", "~> 2.8.0"
  s.add_development_dependency "vcr"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "rake"
end
