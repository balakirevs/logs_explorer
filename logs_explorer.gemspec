require_relative 'lib/logs_explorer/version'

Gem::Specification.new do |spec|
  spec.name        = 'logs_explorer'
  spec.version     = LogsExplorer::VERSION
  spec.authors     = ['Aleksandr Balakiriev']
  spec.email       = ['aleksandr.balakiriev@gmail.com']
  spec.homepage    = 'https://github.com/balakirevs/logs_explorer'
  spec.summary     = 'Access log files'
  spec.description = 'Access log files on remote server'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 4.2'
  spec.add_dependency 'awesome_print'
  spec.add_dependency 'open3'
  spec.add_development_dependency 'pry'
end
