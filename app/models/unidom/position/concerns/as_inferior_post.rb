##
# As Inferior Post 是下级岗位的领域逻辑关注点。

module Unidom::Position::Concerns::AsInferiorPost

  extend ActiveSupport::Concern

  included do |includer|

    has_many :superior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :inferior_post, foreign_key: :inferior_post_id
    has_many :superior_posts,                     through:    :superior_post_reporting_structures,        source: :superior_post

    def report_to!(superior_post, at: Time.now, primary: true)
      superior_post_reporting_structures.superior_post_is(superior_post).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
    end

    def report_to?(superior_post, at: Time.now, primary: true)
      superior_post_reporting_structures.superior_post_is(superior_post).valid_at(now: at).alive.primary(primary).exists?
    end

  end

end
