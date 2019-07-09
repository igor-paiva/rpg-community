require "rails_helper"

RSpec.describe Master, :type => :model do
  describe '.availables' do
    let!(:not_available_master_user) { create(:user) }

    let!(:not_available_master) do
      create(
        :master,
        user: not_available_master_user,
        available: false
      )
    end

    subject { described_class.availables }

    context 'when there is no masters' do
      it 'return nothing' do
        is_expected.to be_empty
      end
    end

    context 'when there is only one master' do
      context 'and it is not available' do
        let(:user) { create(:user) }

        let!(:master) do
          create(:master, user: user, available: false)
        end

        it 'return nothing' do
          is_expected.to be_empty
        end
      end

      context 'and it is available' do
        let(:user) { create(:user) }
        let!(:master) { create(:master, user: user) }

        it 'return the master user' do
          is_expected.to match_array [user]
        end
      end
    end

    context 'when there is many masters' do
      let(:user) { create(:user) }
      let!(:master) { create(:master, user: user) }

      let(:other_user) { create(:user) }
      let!(:other_master) { create(:master, user: other_user) }

      let(:different_user) { create(:user) }

      let!(:different_master) do
        create(:master, user: different_user)
      end

      it 'return masters users' do
        is_expected.to match_array [user, other_user, different_user]
      end
    end
  end
end
