class Master < ApplicationRecord
  has_one :role
  has_many :master_tables
end
