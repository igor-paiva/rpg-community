class User < ApplicationRecord
  has_one :role, dependent: :destroy
  has_one :player, through: :role
  has_one :master, through: :role
  has_many :tables, foreign_key: :admin_id, dependent: :destroy
  has_many :solicitations, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
