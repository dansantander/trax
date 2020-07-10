require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:user) { User.create(name: 'Test') }

  scenario 'User creates a new task' do
    visit('/')

    page.find_by_id('btn-signup').click
    fill_in('user[name]', with: 'Test')
    find('input[name="commit"]').click

    visit '/tasks/new'

    fill_in('task[title]', with: 'Test')
    fill_in('task[amount]', with: 145)
    click_button 'Create'

    visit '/tasks?task%5Binternal%5D=false'

    expect(page).to have_text('Test')
  end
end