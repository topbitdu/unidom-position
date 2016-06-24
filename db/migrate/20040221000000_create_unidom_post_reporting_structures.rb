class CreateUnidomPostReportingStructures < ActiveRecord::Migration

  def change

    create_table :unidom_post_reporting_structures, id: :uuid do |t|

      t.references :superior_post, type: :uuid, null: false
      t.references :inferior_post, type: :uuid, null: false

      t.boolean :elemental, null: false, default: false

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_post_reporting_structures, :superior_post_id
    add_index :unidom_post_reporting_structures, :inferior_post_id

  end

end
