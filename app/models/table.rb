class Table < ApplicationRecord
  belongs_to :admin, class_name: :User

  has_one :master_table, dependent: :destroy
  has_one :master, through: :master_table
  has_many :player_tables, dependent: :destroy

  has_many :solicitations, dependent: :destroy

  def associated_players
    User.joins(player: :player_tables)
        .where(player_tables: { table_id: id })
        .select('users.*')
        .select('players.campaigns')
        .select('player_tables.id AS player_table_id')
  end

  def associated_master
    return { table_name: name } unless master

    user = User.find(master.user_id)

    {
      user_id: user.id,
      table_name: name,
      table_master_id: master_table.id,
      campaigns: master.campaigns,
      user_name: user.name
    }
  end

  def count_players
    counting = PlayerTable.group(:table_id).count
    counting[id].to_i
  end

  def user_associated?(user)
    if master
      return true unless associated_master[:user_id] != user.id
    end

    return true if solicitations.find_by(user_id: user.id)

    player = user.player

    if player_tables && player
      return true if player_tables
                     .find_by(player_id: player.id)
    end
    false
  end
end
