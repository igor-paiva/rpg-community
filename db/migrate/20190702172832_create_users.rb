class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nick_name
      t.text :description
      t.string :phone, index: { unique: true }
      t.string :instagram, index: { unique: true }
      t.string :twitter, index: { unique: true }
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
