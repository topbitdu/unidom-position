$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/position/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-position'
  spec.version     = Unidom::Position::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-position'
  spec.summary     = 'Unidom Position Domain Model Engine 职位领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Position domain model engine includes the Occupation, Position, Post, and Position Reporting Structure models. Unidom (统一领域对象模型)是一系列的领域模型引擎。职位领域模型引擎包括职业、职位、岗位及职位报告关系模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '>= 1.7'

end
