class Solicitation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  scope :for_table_detailed, ->(table_id) {
    joins(:user)
      .where(solicitations: { table_id: table_id })
      .select('users.name')
      .select('solicitations.*')
      .order(created_at: :asc)
  }

  def conclude
    if role == 'Player'
      PlayerTable.create(
        player_id: user.player.id,
        table_id: table.id
      )
    elsif role == 'Master'
      MasterTable.create(
        master_id: user.master.id,
        table_id: table.id
      )
    end

    destroy
  end
end
