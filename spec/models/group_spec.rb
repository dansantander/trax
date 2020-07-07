require 'rails_helper'

RSpec.describe Group, type: :model do

  let(:test_user) { User.create(name: 'TestUser') }

  let(:subject) do
    described_class.new(
      name: 'Test Group',
      icon: '',
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with name over maximum length' do
      subject.name = 'te' * 101
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:groupings) }
    it { should have_many(:tasks) }
  end
end
