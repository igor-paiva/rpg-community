class CreatePlayerTables < ActiveRecord::Migration[5.1]
  def change
    create_table :player_tables do |t|
      t.references :player, null: false, foreign_key: true, on_delete: :cascade
      t.references :table, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end

    add_index :player_tables, %i[player_id table_id], unique: true
  end
end
