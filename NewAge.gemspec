# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "NewAge/version"

Gem::Specification.new do |s|
  s.name        = "NewAge"
  s.version     = NewAge::VERSION
  s.authors     = ["Iain Barnett"]
  s.email       = ["iainspeed@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{People's ages in years and months}
  s.description = %q{Just simple}

  s.rubyforge_project = "NewAge"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
end
