class CreateUnidomOccupations < ActiveRecord::Migration

  def change

    create_table :unidom_occupations, id: :uuid do |t|

      t.references :scheme, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string :code, null: true,  default: nil, limit: 64
      t.string :name, null: false, default: '',  limit: 200

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_occupations, :scheme_id
    add_index :unidom_occupations, [ :code, :scheme_id ], unique: true

  end

end
