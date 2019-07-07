require "rails_helper"

RSpec.describe Player, :type => :model do
  describe '.availables' do
    let!(:no_player_user) { create(:user) }
    let!(:no_user_player) { create(:player) }

    subject { described_class.availables }

    context 'when there is no players' do
      it 'is empty' do
        is_expected.to be_empty
      end
    end

    context 'when there is only one player' do
      let(:user) { create(:user) }
      let(:player) { create(:player) }
      let!(:role) { create(:role, user: user, player: player) }

      it 'return the player user' do
        is_expected.to match_array [user]
      end
    end

    context 'when there is many players' do
      let(:user) { create(:user) }
      let(:player) { create(:player) }
      let!(:role) { create(:role, user: user, player: player) }

      let(:other_user) { create(:user) }
      let(:other_player) { create(:player) }
      let!(:other_role) { create(:role, user: other_user, player: other_player) }

      let(:different_user) { create(:user) }
      let(:different_player) { create(:player) }

      let!(:different_role) do
        create(:role, user: different_user, player: different_player)
      end

      it 'return players users' do
        is_expected.to match_array [user, other_user, different_user]
      end
    end
  end
end