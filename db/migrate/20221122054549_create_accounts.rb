class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :user_type
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.string :email
      t.string :mobile_number

      t.timestamps
    end
    add_index :accounts, :username, unique: true
  end
end
