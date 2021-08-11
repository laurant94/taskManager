require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "task verifications" do
    context "validations" do
      it "title be valid" do
        task = Task.new(title: '', content: 'le contenue de la tache')
        expect(task).not_to be_valid
      end
      it "content be valid" do
        task = Task.new(title: 'my today work', content: '')
        expect(task).not_to be_valid
      end
      it "complet validation" do
        task = Task.new(title: 'Une tache', content: 'La tache qui est créé')
        expect(task).to be_valid
      end
    end
    context "filter" do
      it "filter tasks" do
        tasks = Task.filter_task('zzzz', 'no status').count
        expect(tasks).to eq 0
      end
    end
  end
  
end
