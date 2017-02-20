# Unidom Position Roadmap 职位领域模型引擎路线图

## v0.1
1. Occupation model & migration (20040201000000)
2. Position model & migration (20040211000000)
3. Post model & migration (20040212000000)

## v0.2
1. Post Reporting Structure model & migration (20040221000000)
2. Improve the Post model to add the ``has_many :inferior_post_reporting_structures``, ``has_many :superior_post_reporting_structures``, ``has_many :inferior_posts``, & ``has_many :superior_posts`` macro
3. Improve the Post model to add the .``report!`` method

## v1.0
1. Improve the models to support the Keyword Arguments

## v1.1
1. Rake task unidom:position:occupation:import
2. Improve the Occupation model to add the #scheme_is, #scheme_id_is, & #scheme_type_is scopes

## v1.2
1. As Superior Post concern
2. As Inferior Post concern
3. Improve the Post model to include the As Superior Post concern & the As Inferior Post concern

## v1.2.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.3
1. Improve the As Superior Post concern to add the #``is_reported_to!`` method
2. Improve the As Inferior Post concern to add the #``report_to!`` method

## v1.4
1. Improve the As Superior Post concern for the #``is_reported_to!`` method
2. Improve the As Superior Post concern to add the #``is_reported_to?`` method
3. Improve the As Inferior Post concern for the #``report_to!`` method
4. Improve the As Inferior Post concern to add the #``report_to?`` method

## v1.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.4.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.4.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v1.4.5
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.5.1
1. Improve the Occupation spec for the validations on the #``name`` attribute
2. Improve the Position spec for the validations on the #name attribute
3. Improve the Post spec for the validations on the #name attribute
