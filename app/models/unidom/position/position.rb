# Position 是职位。

class Unidom::Position::Position < Unidom::Position::ApplicationRecord

  self.table_name = 'unidom_positions'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :organization, polymorphic: true
  belongs_to :occupation,   class_name:  'Unidom::Position::Occupation'

  has_many :posts, class_name: 'Unidom::Position::Post'

end
