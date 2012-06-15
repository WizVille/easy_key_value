class EasyKeyValueMigration < ActiveRecord::Migration

  def change
    create_table :easy_key_values do |t|
      t.integer :ekv_id
      t.string :ekv_type

      t.string :key
      t.text :value
    end

    add_index :easy_key_values, :ekv_id, :name => 'ekv_id_ix'
    add_index :easy_key_values, :key, :name => 'key_ix'
  end

end
