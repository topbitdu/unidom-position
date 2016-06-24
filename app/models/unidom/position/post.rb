# Post 是岗位。

class Unidom::Position::Post < ActiveRecord::Base

  self.table_name = 'unidom_posts'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :organization, polymorphic: true
  belongs_to :position,     class_name:  'Unidom::Position::Position'

  has_many :inferior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', foreign_key: :superior_post_id, source: :superior_post
  has_many :superior_post_reporting_structures, class_name: 'Unidom::Position::PostReportingStructure', foreign_key: :inferior_post_id, source: :inferior_post

  has_many :inferior_posts, through: :inferior_post_reporting_structures, source: :inferior_post
  has_many :superior_posts, through: :superior_post_reporting_structures, source: :superior_post

end
