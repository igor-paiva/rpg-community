class CreateSolicitations < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitations do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :table, null: false, foreign_key: true, on_delete: :cascade
      t.string :role, null: false

      t.timestamps
    end

    add_index :solicitations, %i[user_id table_id], unique: true
  end
end

