class Master < ApplicationRecord
  belongs_to :user
  has_many :master_tables

  scope :availables, ->() {
    User.joins(:master)
      .where(masters: { available: true })
      .select('users.*')
      .select('masters.campaigns')
      .shuffle
  }
end
