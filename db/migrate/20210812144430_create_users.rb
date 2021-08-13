class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.boolean :active
      t.text :token
      t.text :bio

      t.timestamps
    end
  end
end
