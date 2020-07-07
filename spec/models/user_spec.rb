require 'rails_helper'

RSpec.describe User, type: :model do

  let(:test_user) { User.create(name: 'TestUser') }

  describe 'Model' do
    it 'should exist' do
      expect(test_user).not_to be_nil
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(test_user).to be_valid
    end

    it 'is not valid without a name' do
      test_user.name = nil
      expect(test_user).to_not be_valid
    end
    
    it 'is not valid with name under minimum length' do
      test_user.name = 'te'
      expect(test_user).to_not be_valid
    end

    it 'is not valid with name over maximum length' do
      test_user.name = 'te'*10
      expect(test_user).to_not be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:groups) }
  end


end