class Table < ApplicationRecord
  belongs_to :admin, class_name: :User

  has_one :master_table, dependent: :destroy
  has_one :master, through: :master_table
  has_many :player, through: :player_tables
  has_many :player_tables, dependent: :destroy

  def associated_players
    User.joins(player: :player_tables)
        .where(player_tables: { table_id: id })
        .select('users.*')
        .select('players.campaigns')
  end

  def associated_master
    return { master: master, table_name: name } unless master

    user = User.find(master.role.user_id)

    {
      user_id: user.id,
      table_name: name,
      campaigns: master.campaigns,
      user_name: user.name
    }

  end
end
