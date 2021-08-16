class CreateJoinTableLabelsTasks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :labels, :tasks do |t|
      t.references :label, foreign_key: true
      t.references :task, foreign_key: true
    end
  end
end
