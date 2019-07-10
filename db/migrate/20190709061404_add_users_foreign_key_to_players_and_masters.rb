class AddUsersForeignKeyToPlayersAndMasters < ActiveRecord::Migration[5.1]
  def change
    add_reference :players,
                  :user,
                  foreign_key: { on_delete: :cascade },
                  index: { unique: true }
    add_reference :masters,
                  :user,
                  foreign_key: { on_delete: :cascade },
                  index: { unique: true }
  end
end

