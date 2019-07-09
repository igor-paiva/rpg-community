class Solicitation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  def conclude
    if role == 'Player'
      PlayerTable.create(player_id: user.player.id,
                         table_id: table.id)
    elsif role == 'Master'
      MasterTable.create(master_id: user.master.id,
                         table_id: table.id)
    end
    destroy
  end
end
