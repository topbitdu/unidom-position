# Unidom Position 职位领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-position.svg)](https://badge.fury.io/rb/unidom-position)

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
The migration versions start with 200101.

## Call the Model
```ruby
position = Unidom::Position::Position.valid_at.alive.first

occupation = Unidom::Position::Occupation.valid_at.alive.first

post = Unidom::Position::Post.valid_at.alive.first
```
