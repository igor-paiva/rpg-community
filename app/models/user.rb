class User < ApplicationRecord
  has_one :role
  has_one :player, through: :role
  has_one :master, through: :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
