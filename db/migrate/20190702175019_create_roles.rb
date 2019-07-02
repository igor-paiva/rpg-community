class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :player,foreign_key: true, on_delete: :nullify
      t.references :master,foreign_key: true, on_delete: :nullify

      t.timestamps
    end

    add_index :roles, %i[player_id master_id] , unique: true
  end
end
