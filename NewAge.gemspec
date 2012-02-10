# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "NewAge/version"

Gem::Specification.new do |s|
  s.name        = "NewAge"
  s.version     = NewAge::VERSION
  s.authors     = ["Iain Barnett"]
  s.email       = ["iainspeed@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Handling the input and output of people's ages in years and months}
  s.description = %q{Handling the input and output of people's ages in years and months}

  s.rubyforge_project = "NewAge"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "yard"
  s.add_development_dependency "reek"
  s.add_development_dependency "redcarpet"
end
