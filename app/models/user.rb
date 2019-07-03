class User < ApplicationRecord
  has_one :role
  has_one :player, through: :role
  has_one :master, through: :role
  has_many :tables, foreign_key: :admin_id, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
