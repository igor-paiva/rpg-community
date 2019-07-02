class Player < ApplicationRecord
  has_one :role
  has_many :player_tables
end
