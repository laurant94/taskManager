class AddtasksIndexToTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :title
    add_index :tasks, :status
    add_index :tasks, :expired_at
  end
end
