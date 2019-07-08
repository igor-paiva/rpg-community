class Master < ApplicationRecord
  has_one :role, dependent: :nullify
  has_many :master_tables

  scope :availables, ->() {
    User.joins(:master)
      .where(masters: { available: true })
      .select('users.*')
      .select('masters.campaigns')
      .shuffle
  }
end
