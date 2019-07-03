class CreateMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :masters do |t|
      t.integer :campaigns
      t.boolean :available, null: false, default: true

      t.timestamps
    end
  end
end
