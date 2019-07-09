require "rails_helper"

RSpec.describe Player, :type => :model do
  describe '.availables' do
    let!(:not_available_player_user) { create(:user) }

    let!(:not_available_player) do
      create(
        :player,
        user: not_available_player_user,
        available: false
      )
    end

    subject { described_class.availables }

    context 'when there is no players' do
      it 'return nothing' do
        is_expected.to be_empty
      end
    end

    context 'when there is only one player' do
      context 'and it is not available' do
        let(:user) { create(:user) }
        let!(:player) { create(:player, user: user, available: false) }

        it 'return nothing' do
          is_expected.to be_empty
        end
      end

      context 'and it is available' do
        let(:user) { create(:user) }
        let!(:player) { create(:player, user: user) }

        it 'return the player user' do
          is_expected.to match_array [user]
        end
      end
    end

    context 'when there is many players' do
      let(:user) { create(:user) }
      let!(:player) { create(:player, user: user) }

      let(:other_user) { create(:user) }
      let!(:other_player) { create(:player, user: other_user) }

      let(:different_user) { create(:user) }

      let!(:different_player) do
        create(:player, user: different_user)
      end

      it 'return players users' do
        is_expected.to match_array [user, other_user, different_user]
      end
    end
  end
end
