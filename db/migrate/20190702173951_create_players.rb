class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :campaigns
      t.boolean :available, null: false, default: true

      t.timestamps
    end
  end
end
