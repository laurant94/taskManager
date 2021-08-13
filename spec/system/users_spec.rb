require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'visitor' do
    context 'create client' do
      it 'and show' do
        user = FactoryBot.create(:user, username: 'clients3', email: 'clients3@cl.fr',
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        # visit root_path(user.id)
        # binding.irb
        # current_path
        # page.html
        expect(user).to be_valid
      end
    end
    context 'create admin' do
      it 'and show' do
        user = FactoryBot.create(:admin_user, username: 'admins1', email: 'admins1@cl.fr',
          password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role: 'admin')
        # visit root_path(user.id)
        # binding.irb
        # current_path
        # page.html
        expect(user).to be_valid
      end
    end

    context 'user' do
      it 'login' do
        user = FactoryBot.create(:user, username: 'client4', email: 'client4@cl.com',
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        visit login_path
        fill_in "user[username]",	with: user.username
        fill_in "user[password]",	with: user.password 
        click_button 'Connexion'
        # binding.irb
        current_path
        page.html
        expect(page).to have_content 'Create Task'
      end
    end

    context 'admin' do
      it 'admin space' do
        user = FactoryBot.create(:user, username: 'admin2', email: 'admin2@cl.com',
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role: 'admin')
        visit login_path
        fill_in "user[username]",	with: user.username
        fill_in "user[password]",	with: user.password 
        click_button 'Connexion'
        # binding.irb
        current_path
        page.html
        expect(page).to have_content 'Admin'
      end
      it 'client' do
        user = FactoryBot.create(:user, username: 'client6', email: 'client6@cl.com',
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        visit login_path
        fill_in "user[username]",	with: user.username
        fill_in "user[password]",	with: user.password 
        click_button 'Connexion'
        # binding.irb
        current_path
        page.html
        expect(page).to_not have_content 'Admin'
      end
    end
   
  end
end
