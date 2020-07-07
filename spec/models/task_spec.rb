require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:test_user) { User.create(name: 'TestUser') }

  let(:subject) do
    described_class.new(
      title: 'Test Task',
      amount: 35,
      creator_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with title over maximum length' do
      subject.title = 'te' * 100
      expect(subject).to_not be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a non integer amount' do
      subject.amount = 'x'
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:groupings) }
    it { should have_many(:groups) }
  end
end