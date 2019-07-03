class CreateMasterTables < ActiveRecord::Migration[5.1]
  def change
    create_table :master_tables do |t|
      t.references :master, null: false, foreign_key: true, on_delete: :cascade
      t.references :tabPlale, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end

    add_index :master_tables, %i[master_id table_id], unique: true
  end
end
