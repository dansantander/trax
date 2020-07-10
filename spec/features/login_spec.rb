require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:user) { User.create(name: 'Test') }

  scenario 'User registers and logs in automatically' do
    visit('/')

    page.find_by_id('btn-signup').click
    fill_in('user[name]', with: 'Test')
    find('input[name="commit"]').click

    expect(page).to have_text('Logout')
  end

  scenario 'User logs in with existing user' do
    visit('/')

    page.find_by_id('btn-signin').click
    fill_in('username_in', with: 'Test')
    find('input[name="commit"]').click

    expect(page).to have_text('Logout')
  end

  scenario 'User logs out and returns to home screen' do
    visit('/')

    page.find_by_id('btn-signin').click
    fill_in('username_in', with: 'Test')
    find('input[name="commit"]').click
    click_link 'Logout'

    expect(page).to have_text('LOG IN')
  end
end
