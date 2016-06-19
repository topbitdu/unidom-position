class CreateUnidomPosts < ActiveRecord::Migration

  def change

    create_table :unidom_posts, id: :uuid do |t|

      t.references :organization, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :position, type: :uuid, null: false

      t.string :name, null: false, default: '', limit: 200

      t.boolean :part_time, null: false, default: false
      t.boolean :temporary, null: false, default: false

      # t.date :expected_from_date, null: false, default: '1970-01-01'
      # t.date :expected_thru_date, null: false, default: '3000-01-01'
      # t.date :actual_from_date,   null: false, default: '1970-01-01'
      # t.date :actual_thru_date,   null: false, default: '3000-01-01'
      t.datetime :expection_opened_at, null: false, default: Time.utc(1970)
      t.datetime :expection_closed_at, null: false, default: Time.utc(3000)

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_posts, :organization_id
    add_index :unidom_posts, :position_id

  end

end
