# Unidom Position 职位领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-position.svg)](https://badge.fury.io/rb/unidom-position)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-position.svg)](https://gemnasium.com/github.com/topbitdu/unidom-position)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Position domain model engine includes the Occupation, Position, Post, and Position Reporting Structure models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。职位领域模型引擎包括职业、职位、岗位及职位报告关系模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-position'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200402.

## Call the Model
```ruby

occupation = Unidom::Position::Occupation.valid_at.alive.first

position = Unidom::Position::Position.valid_at.alive.first

post = Unidom::Position::Post.valid_at.alive.first

chief_programmer = Unidom::Position::Post.create! name: 'Chief Programmer', position: position
erlang_developer = Unidom::Position::Post.create! name: 'Erlang Developer', position: position

Unidom::Position::PostReportingStructure.report!(superior_post: chief_programmer, inferior_post: erlang_developer, opened_at: Time.now, elemental: true)

```

## Rake Task
```shell
bundle exec rake unidom:position:occupation:import file=/data.csv from_date=2009-11-01 thru_date=2015-10-01 scheme_id= scheme_type=
```

## Include the Concerns
The Post model already includes the following concerns:
```ruby
include Unidom::Position::Concerns::AsInferiorPost
include Unidom::Position::Concerns::AsSuperiorPost
```

### As Inferior Post
The As Inferior Post concern do the following tasks for the includer automatically:  
1. Define the has_many :superior_post_reporting_structures macro as: ``has_many :superior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :inferior_post, foreign_key: :inferior_post_id``  
2. Define the has_many :superior_posts macro as: ``has_many :superior_posts, through: :superior_post_reporting_structures, source: :superior_post``  
3. Define the #report_to! method as: ``report_to!(superior_post, at: Time.now, primary: true)``  
4. Define the #report_to? method as: ``report_to?(superior_post, at: Time.now, primary: true)``

### As Superior Post
The As Superior Post concern do the following tasks for the includer automatically:  
1. Define the has_many :inferior_post_reporting_structures macro as: ``has_many :inferior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :superior_post, foreign_key: :superior_post_id``  
2. Define the has_many :inferior_posts macro as: ``has_many :inferior_posts, through: :inferior_post_reporting_structures, source: :inferior_post``  
3. Define the #is_reported_to! method as: ``is_reported_to!(by: nil, at: Time.now, primary: true)``  
4. Define the #is_reported_to? method as: ``is_reported_to?(by: nil, at: Time.now, primary: true)``
