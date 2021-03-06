require "rails_helper"

RSpec.describe Table, :type => :model do
  describe '#associated_players' do
    let!(:table) { create(:table, max_players: 5) }

    let(:other_table) { create(:table, max_players: 5) }

    let!(:other_player_tables) do
      create_list(:player_table, 3, table: other_table)
    end

    subject { table.associated_players }

    context 'when there is no players associated' do
      it 'return nothing' do
        is_expected.to be_empty
      end
    end

    context 'when there is only one player associated' do
      let(:player) { create(:player) }

      let!(:player_table) do
        create(:player_table, table: table, player: player)
      end

      it 'return the player' do
        is_expected.to match_array [player.user]
      end
    end

    context 'when there is many players associated' do
      let!(:player_tables) do
        create_list(:player_table, 3, table: table)
      end

      it 'return the player' do
        is_expected.to match_array [
          player_tables.first.player.user,
          player_tables.second.player.user,
          player_tables.third.player.user
        ]
      end
    end
  end

  describe '#associated_master' do
    let!(:table) { create(:table) }

    let(:other_table) { create(:table) }

    let!(:other_master_table) do
      create(:master_table, table: other_table)
    end

    subject { table.associated_master }

    context 'when there is no master associated' do
      it 'return the table name' do
        is_expected.to eq({ table_name: table.name })
      end
    end

    context 'when there is a master associated' do
      let(:master) { create(:master) }

      let!(:master_table) do
        create(:master_table, table: table, master: master)
      end

      let!(:table_data) do
        {
          user_id: master.user.id,
          table_name: table.name,
          table_master_id: master_table.id,
          campaigns: master.campaigns,
          user_name: master.user.name
        }
      end

      it 'return table data' do
        is_expected.to eq table_data
      end
    end
  end

  describe '#count_players' do
    let!(:table) { create(:table, max_players: 10) }

    let(:other_table) { create(:table, max_players: 5) }

    let!(:other_player_tables) do
      create_list(:player_table, 3, table: other_table)
    end

    subject { table.count_players }

    context 'when there is no players associated' do
      it 'return 0' do
        is_expected.to eq 0
      end
    end

    context 'where there is many players associated' do
      let!(:player_tables) do
        create_list(:player_table, 5, table: table)
      end

      it 'return the quantity of players' do
        is_expected.to eq player_tables.length
      end
    end
  end

  describe '#user_associated?' do
    let!(:table) { create(:table, max_players: 10) }

    let!(:player_tables) do
      create_list(:player_table, 3, table: table)
    end

    let(:other_table) { create(:table, max_players: 5) }

    let!(:other_player_tables) do
      create_list(:player_table, 3, table: other_table)
    end

    context 'when the user is not associated' do
      let!(:user) { create(:user) }

      subject { table.user_associated?(user) }

      it 'return false' do
        is_expected.to be false
      end
    end

    context 'when the user is associated' do
      let!(:user) { create(:user) }

      subject { table.user_associated?(user) }

      context 'and it is a player' do
        let(:player) { create(:player, user: user) }

        let!(:player_table) do
          create(:player_table, table: table, player: player)
        end

        it 'return true' do
          is_expected.to be true
        end
      end

      context 'and it is a master' do
        let(:master) { create(:master, user: user) }

        let!(:master_table) do
          create(:master_table, table: table, master: master)
        end

        it 'return true' do
          is_expected.to be true
        end
      end
    end
  end
end
