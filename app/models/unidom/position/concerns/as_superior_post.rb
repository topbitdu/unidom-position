module Unidom::Position::Concerns::AsSuperiorPost

  extend ActiveSupport::Concern

  included do |includer|

    has_many :inferior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :superior_post, foreign_key: :superior_post_id
    has_many :inferior_posts,                     through:    :inferior_post_reporting_structures,        source: :inferior_post

    def is_reported_to!(by: nil, at: Time.now, primary: true)
      inferior_post_reporting_structures.inferior_post_is(by).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
    end

    def is_reported_to?(by: nil, at: Time.now, primary: true)
      inferior_post_reporting_structures.inferior_post_is(by).valid_at(now: at).alive.primary(primary).exists?
    end

  end

end
