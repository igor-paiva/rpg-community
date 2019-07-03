class Table < ApplicationRecord
  has_many :player_tables, dependent: :destroy
  has_one :master_table, dependent: :destroy
end
