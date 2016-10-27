# Occupation 是职业。

class Unidom::Position::Occupation < Unidom::Position::ApplicationRecord

  self.table_name = 'unidom_occupations'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :scheme, polymorphic: true

  has_many :positions, class_name: 'Unidom::Position::Position'
  has_many :posts,     through:    :positions, source: :posts

  scope :scheme_is,      ->(scheme)      { where scheme:      scheme      }
  scope :scheme_id_is,   ->(scheme_id)   { where scheme_id:   scheme_id   }
  scope :scheme_type_is, ->(scheme_type) { where scheme_type: scheme_type }

end
