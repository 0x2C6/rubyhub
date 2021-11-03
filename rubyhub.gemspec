lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rubyhub"
  spec.version       = '0.1.0'
  spec.authors       = ["Farhad"]
  spec.email         = ["farhadeyvazli@gmail.com"]

  spec.summary       = %q{fetch repos from git hosts}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
end
