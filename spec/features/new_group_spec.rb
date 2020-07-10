require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:user) { User.create(name: 'Test') }

  scenario 'User creates a new group' do
    visit('/')

    page.find_by_id('btn-signup').click
    fill_in('user[name]', with: 'Test')
    find('input[name="commit"]').click

    visit '/groups/new'

    fill_in('group[name]', with: 'TestGroup')
    click_button 'Create'

    expect(page).to have_text('TestGroup')
  end
end
