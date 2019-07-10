require "rails_helper"

RSpec.describe Solicitation, :type => :model do
  describe '.for_table_detailed' do
    let!(:table) { create(:table) }

    let!(:other_table) { create(:table) }
    let!(:other_player) { create(:player) }

    let!(:other_table_solicitation) do
      create(:solicitation, :for_player, table: other_table, user: other_player.user)
    end

    subject { described_class.for_table_detailed(table.id) }

    context 'when there is no solicitations' do
      it 'return nothing' do
        is_expected.to be_empty
      end
    end

    context 'when there is one solicitation' do
      context 'and its for player' do
        let!(:player) { create(:player) }

        let!(:solicitation) do
          create(:solicitation, :for_player, table: table, user: player.user)
        end

        it 'return the solicitation' do
          is_expected.to match_array [solicitation]
        end
      end

      context 'and its for master' do
        let!(:master) { create(:master) }

        let!(:solicitation) do
          create(:solicitation, :for_master, table: table, user: master.user)
        end

        it 'return the solicitation' do
          is_expected.to match_array [solicitation]
        end
      end
    end

    context 'when there is many solicitations' do
      let!(:players) do
        create_list(:player, 3)
      end

      let!(:solicitation_one) do
        create(:solicitation, :for_player, table: table, user: players.first.user)
      end

      let!(:solicitation_two) do
        create(:solicitation, :for_player, table: table, user: players.second.user)
      end

      let!(:solicitation_three) do
        create(:solicitation, :for_player, table: table, user: players.third.user)
      end

      it 'return the respective solicitations' do
        is_expected.to match_array [
          solicitation_one,
          solicitation_two,
          solicitation_three
        ]
      end
    end
  end
end
