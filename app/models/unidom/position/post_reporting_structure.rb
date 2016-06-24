# Post Reporting Structure 是岗位汇报结构。

class Unidom::Position::PostReportingStructure < ActiveRecord::Base

  self.table_name = 'unidom_post_reporting_structures'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :superior_post, class_name: 'Unidom::Position::Post', foreign_key: :superior_post_id
  belongs_to :inferior_post, class_name: 'Unidom::Position::Post', foreign_key: :inferior_post_id

  scope :superior_post_is, ->(superior_post) { where superior_post_id: to_id(superior_post) }
  scope :inferior_post_is, ->(inferior_post) { where inferior_post_id: to_id(inferior_post) }

  def self.report!(superior_post, inferior_post, opened_at = Time.now, elemental = true)
    self.inferior_post_is(inferior_post).superior_post_is(superior_post).valid_at.alive.first_or_create! opened_at: opened_at, elemental: elemental
  end

end
