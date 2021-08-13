require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'create' do
    context 'new user' do
      it 'and show' do
        user = FactoryBot.create(:user)
        # visit root_path(user.id)
        # binding.irb
        # current_path
        # page.html
        expect(user).to be_valid
      end
    end
    context 'new admin' do
      it 'and show' do
        user = FactoryBot.create(:admin_user1)
        # visit root_path(user.id)
        # binding.irb
        # current_path
        # page.html
        expect(user).to be_valid
      end
    end
  end

  describe 'root' do
    context 'client' do
      it 'not login' do
        # session.destroy 
        visit root_path
        current_path
        page.html
        expect(page).to have_content 'Se connecter'
      end
    end
  end
end
