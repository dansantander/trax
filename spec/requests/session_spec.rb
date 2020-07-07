require 'rails_helper'

RSpec.describe User do
  describe 'GET /signin' do
    it 'should show the login page' do
      get signin_path
      expect(response).to be_successful
      expect(response).to render_template('sessions/new')
    end
  end

  describe 'GET /signup' do
    it 'should show the signup page' do
      get new_user_path
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
  end
end
