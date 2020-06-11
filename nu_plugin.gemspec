lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nu_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = 'nu_plugin'
  spec.version       = NuPlugin::VERSION
  spec.authors       = ['Andrés N. Robalino']
  spec.email         = ['andres@androbtech.com']

  spec.summary       = 'Write Nu plugins now.'
  spec.description   = 'Te gustará.'
  spec.homepage      = 'https://nushell.sh'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/andrasio/nu_plugin.git'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
end
