require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    context 'new user' do
      it 'and show' do
        user = User.new(username: 'clients1n', email: 'clients1n@cl.fr',
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        # visit root_path(user.id)
        # binding.irb
        # current_path
        # page.html
        expect(user).to be_valid
      end
    end
  end
end
