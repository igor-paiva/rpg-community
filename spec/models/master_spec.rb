require "rails_helper"

RSpec.describe Master, :type => :model do
  describe '.availables' do
    let!(:no_master_user) { create(:user) }
    let!(:no_user_master) { create(:master) }

    subject { described_class.availables }

    context 'when there is no masters' do
      it 'is empty' do
        is_expected.to be_empty
      end
    end

    context 'when there is only one master' do
      let(:user) { create(:user) }
      let(:master) { create(:master) }
      let!(:role) { create(:role, user: user, master: master) }

      it 'return the master user' do
        is_expected.to match_array [user]
      end
    end

    context 'when there is many masters' do
      let(:user) { create(:user) }
      let(:master) { create(:master) }
      let!(:role) { create(:role, user: user, master: master) }

      let(:other_user) { create(:user) }
      let(:other_master) { create(:master) }
      let!(:other_role) { create(:role, user: other_user, master: other_master) }

      let(:different_user) { create(:user) }
      let(:different_master) { create(:master) }

      let!(:different_role) do
        create(:role, user: different_user, master: different_master)
      end

      it 'return masters users' do
        is_expected.to match_array [user, other_user, different_user]
      end
    end
  end
end
