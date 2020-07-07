require 'rails_helper'

RSpec.describe Grouping, type: :model do
  
  let(:test_task) { Task.create(name: 'TestTask') }
  let(:test_group) { Group.create(title: 'ExampleGroup') }
  let(:subject) do
    described_class.new(
      group_id: 1,
      task_id: 1,
    )
  end

  describe 'Associations' do
    it { should belong_to(:task) }
    it { should belong_to(:group) }
  end
end