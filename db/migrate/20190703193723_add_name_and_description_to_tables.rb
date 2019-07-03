class AddNameAndDescriptionToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :name, :string
    add_column :tables, :description, :text

    change_column_null :tables, :name, false
  end
end
