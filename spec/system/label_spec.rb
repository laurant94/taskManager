require 'rails_helper'

RSpec.describe "Labels", type: :system do
  describe 'visitor' do
    context 'create label' do
      it 'and show' do
        user = FactoryBot.create(:user, username: 'labelu', email: "labelu@us.com",
        password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        label = FactoryBot.create(:label, name: "Pie", user: user)
        visit label_path(label.id)
        # binding.irb
        current_path
        page.html
        expect(label).to be_valid
      end
    end
  end
end
