# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "moby/version"

Gem::Specification.new do |s|
  s.name        = "moby"
  s.version     = Moby::VERSION
  s.authors     = ["Dan Richert"]
  s.email       = ["dan.richert@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby interface for Moby wordlists}
  s.description = %q{Ruby interface for the world's largest free phonetic database}

  s.rubyforge_project = "moby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
