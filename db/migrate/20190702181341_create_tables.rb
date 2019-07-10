class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :admin_id, null: false
      t.foreign_key :users, column: :admin_id, on_delete: :cascade

      t.boolean :available, null: false, default: true
      t.integer :max_players, null: false

      t.timestamps
    end
  end
end
