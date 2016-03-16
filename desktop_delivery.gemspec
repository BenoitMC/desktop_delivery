lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "desktop_delivery/version"

Gem::Specification.new do |spec|
  spec.name          = "desktop_delivery"
  spec.version       = DesktopDelivery::VERSION
  spec.authors       = ["Benoit MARTIN-CHAVE"]
  spec.email         = ["benoit@martin-chave.ch"]

  spec.summary       = %q{Open Rails emails in your desktop client}
  spec.description   = %q{Open Rails emails in your desktop client}
  spec.homepage      = "https://github.com/BenoitMC/desktop_delivery"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "launchy"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "mail"
end
