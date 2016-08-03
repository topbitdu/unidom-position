module Unidom::Position::Concerns::AsSuperiorPost

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :inferior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :superior_post, foreign_key: :superior_post_id
    has_many :inferior_posts,                     through:    :inferior_post_reporting_structures,        source: :inferior_post

  end

end
