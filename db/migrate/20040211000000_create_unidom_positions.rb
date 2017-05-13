class CreateUnidomPositions < ActiveRecord::Migration

  def change

    create_table :unidom_positions, id: :uuid do |t|

      t.references :organization, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :occupation,   type: :uuid, null: false

      t.string :name, null: false, default: '', limit: 200

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_positions, :organization_id
    add_index :unidom_positions, :occupation_id

  end

end
