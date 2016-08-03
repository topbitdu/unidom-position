module Unidom::Position::Concerns::AsInferiorPost

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :superior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :inferior_post, foreign_key: :inferior_post_id
    has_many :superior_posts,                     through:    :superior_post_reporting_structures,        source: :superior_post

  end

end
