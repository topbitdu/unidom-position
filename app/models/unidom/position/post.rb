# Post 是岗位。

class Unidom::Position::Post < ActiveRecord::Base

  self.table_name = 'unidom_posts'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Position::Concerns::AsInferiorPost
  include Unidom::Position::Concerns::AsSuperiorPost

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :organization, polymorphic: true
  belongs_to :position,     class_name:  'Unidom::Position::Position'

end
