# Occupation 是职业。

class Unidom::Position::Occupation < ActiveRecord::Base

  self.table_name = 'unidom_occupations'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  belongs_to :scheme, polymorphic: true

  has_many :positions, class_name: 'Unidom::Position::Position'
  has_many :posts,     through:    :positions, source: :posts

end
