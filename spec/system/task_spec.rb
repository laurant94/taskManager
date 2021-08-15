require 'rails_helper'
RSpec.describe 'task management', type: :system do
  # let!(:task) {FactoryBot.create(:task, title: 'salut', 
  #   content: 'description', status: 'en cours', 
  #   expired_at: '2021-08-26 23:45:00')}

  describe 'task manager' do
    context 'show' do
      it 'all tasks order by created date and time' do
        visit tasks_path(column: 'expired_at', order: 'desc')
        #binding.irb
        current_path
        page.html
      end
    end
    context "serach" do
      it "by title" do
        tasks = Task.filter_task("salut").count
        expect(tasks).to eq 0
      end
      it "by status" do
        tasks = Task.filter_task('', 'en cours').count
        expect(tasks).to eq 0
      end
      it "by title and status" do
        tasks = Task.filter_task('', 'en attente').count
        expect(tasks).to eq 0
      end
    end
    context "order" do
      it "by status" do
        visit tasks_path(column: 'status', order: 'desc')
        #binding.irb
        current_path
        page.html
      end
    end
  end

  describe 'create' do
    context 'new task' do
      it 'and show' do
        user = FactoryBot.create(:user, username: 'labelus', email: "labelus@us.com",
          password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa')
        task = FactoryBot.create(:task, title: 'task', 
          content: 'le contenue legitime', status: 'en attente',
          expired_at: '2021-08-26 23:45:00', user: user)
        
        visit task_path(task.id)
        # binding.irb
        current_path
        page.html
        expect(task).to be_valid
      end
    end
  end
end