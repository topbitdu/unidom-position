##
# As Inferior Post 是下级岗位的领域逻辑关注点。

module Unidom::Position::Concerns::AsInferiorPost

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :superior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', source: :inferior_post, foreign_key: :inferior_post_id
    has_many :superior_posts,                     through:    :superior_post_reporting_structures,        source: :superior_post

    ##
    # 以下级岗位的身份与上级岗位 superior_post 建立岗位间的上下级汇报关系。
    # 主要汇报标志是 primary ，缺省为 true 。建立时间是 at ，缺省为当前时间。如：
    # rails_developer.report_to! project_manager, primary: false
    def report_to!(superior_post, at: Time.now, primary: true)

      assert_present! :superior_post, superior_post

      superior_post_reporting_structures.superior_post_is(superior_post).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
    end

    def report_to?(superior_post, at: Time.now, primary: true)
      superior_post_reporting_structures.superior_post_is(superior_post).valid_at(now: at).alive.primary(primary).exists?
    end

  end

end
