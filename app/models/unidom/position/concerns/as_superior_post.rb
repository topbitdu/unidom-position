##
# As Superior Post 是上级岗位的领域逻辑关注点。

module Unidom::Position::Concerns::AsSuperiorPost

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :inferior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :superior_post, foreign_key: :superior_post_id
    has_many :inferior_posts,                     through:    :inferior_post_reporting_structures,        source: :inferior_post

    ##
    # 以上级岗位的身份与下级岗位 by 建立岗位间的上下级汇报关系。
    # 主要汇报标志是 primary ，缺省为 true 。建立时间是 at ，缺省为当前时间。如：
    # project_manager.is_reported_to! by: rails_developer, primary: false
    def is_reported_to!(by: nil, at: Time.now, primary: true)

      assert_present! :by, by

      inferior_post_reporting_structures.inferior_post_is(by).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
    end

    def is_reported_to?(by: nil, at: Time.now, primary: true)
      inferior_post_reporting_structures.inferior_post_is(by).valid_at(now: at).alive.primary(primary).exists?
    end

  end

end
