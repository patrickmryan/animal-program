# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Animal"
  spec.version       = '1.0'
  spec.authors       = ["Patrick M. Ryan"]
  spec.email         = ["pmryan@us.ibm.com"]
  spec.summary       = %q{Animal program}
  spec.description   = %q{Animal program. Demonstrate binary trees.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/Animal.rb']
  spec.executables   = ['bin/Animal']
  spec.test_files    = ['tests/test_Animal.rb']
  spec.require_paths = ["lib"]
end
