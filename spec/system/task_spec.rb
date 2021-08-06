require 'rails_helper'
RSpec.describe 'task management', type: :system do
  let!(:task) {FactoryBot.create(:task, title: 'task title', content: 'description')}
  describe 'task manager' do
    context 'show' do
      it 'all tasks order by created date and time' do
        visit tasks_path
        #binding.irb
        current_path
        page.html
      end
    end
  end

  describe 'create' do
    context 'new task' do
      it 'and show' do
        task = FactoryBot.create(:task, title: 'task', content: 'le contenue legitime')
        visit task_path(task.id)
        #binding.irb
        current_path
        page.html
        expect(page).to have_content 'task'
      end
    end
  end
  
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
       end
     end
  end
end