# Unidom Position Change Log 职位领域模型引擎变更日志

## v0.1
1. Occupation model & migration (20040201000000)
2. Position model & migration (20040211000000)
3. Post model & migration (20040212000000)

## v0.2
1. Post Reporting Structure model & migration (20040221000000)
2. Improved the Post model to add the ``has_many :inferior_post_reporting_structures``, ``has_many :superior_post_reporting_structures``, ``has_many :inferior_posts``, & ``has_many :superior_posts`` macro
3. Improved the Post model to add the .``report!`` method

## v1.0
1. Improved the models to support the Keyword Arguments

## v1.1
1. Rake task unidom:position:occupation:import
2. Improved the Occupation model to add the ``scheme_is`` scope, the #``scheme_id_is`` scope, & the ``scheme_type_is`` scope

## v1.2
1. As Superior Post concern
2. As Inferior Post concern
3. Improved the Post model to include the As Superior Post concern & the As Inferior Post concern

## v1.2.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.3
1. Improved the As Superior Post concern to add the #``is_reported_to!`` method
2. Improved the As Inferior Post concern to add the #``report_to!`` method

## v1.4
1. Improved the As Superior Post concern for the #``is_reported_to!`` method
2. Improved the As Superior Post concern to add the #``is_reported_to?`` method
3. Improved the As Inferior Post concern for the #``report_to!`` method
4. Improved the As Inferior Post concern to add the #``report_to?`` method

## v1.4.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.4.3
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.4.4
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension concern

## v1.4.5
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.5
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.5.1
1. Improved the Occupation spec for the validations on the #``name`` attribute
2. Improved the Position spec for the validations on the #``name`` attribute
3. Improved the Post spec for the validations on the #``name`` attribute

## v1.5.2
1. Improved the Occupation spec for the ``has_many :positions, class_name: 'Unidom::Position::Position'`` macro
2. Improved the Position spec for the ``belongs_to :occupation, class_name: 'Unidom::Position::Occupation'`` macro

## v1.5.3
1. Improved the Occupation spec for the scheme_id_is scope, & the scheme_type_is scope
2. Improved the Position spec for the ``has_many :posts, class_name: 'Unidom::Position::Post'`` macro

## v1.5.4
1. Improved the Occupation spec for the validations on the #``name`` attribute
2. Improved the Position spec for the validations on the #``name`` attribute
3. Improved the Post spec for the validations on the #``name`` attribute

## v1.5.5
1. Improve the Post spec for the ``belongs_to :position, class_name: 'Unidom::Position::Position'`` macro
2. Improve the Post Reporting Structure spec for the ``belongs_to :superior_post, class_name: 'Unidom::Position::Post', foreign_key: :superior_post_id`` macro, & the ``belongs_to :inferior_post, class_name: 'Unidom::Position::Post', foreign_key: :inferior_post_id`` macro

## v1.5.6
1. Improve the Position model for the occupation_is scope
2. Improve the Position spec for the occupation_is scope

## v1.5.7
1. Improve the Post Reporting Structure spec for the superior_post_is scope, & the inferior_post_is scope
2. RSpec shared examples manifest

## v1.5.8
1. Improve the As Inferior Post concern for the argument validations of the #report_to! method
2. Improve the As Superior Post concern for the argument validations of the #is_reported_to! method

## v1.5.9
1. Improve the Ruby Gem Specification to depend on unidom-common v1.10
2. Improve the Occupation migration, the Position migration, the Post migration, & the Post Reporting Structure migration for the #opened_at column, & the #closed_at column
