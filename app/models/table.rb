class Table < ApplicationRecord
  belongs_to :admin, class_name: :User

  has_one :master_table, dependent: :destroy
  has_many :player_tables, dependent: :destroy
end
