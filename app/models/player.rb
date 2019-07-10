class Player < ApplicationRecord
  belongs_to :user
  has_many :player_tables

  scope :availables, ->() {
    User.joins(:player)
      .where(players: { available: true })
      .select('users.*')
      .select('players.campaigns')
      .shuffle
  }
end
