class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expired_at, :datetime, default: "00-00-0000 00:00"
    add_column :tasks, :status, :integer, default: 1
  end
end
