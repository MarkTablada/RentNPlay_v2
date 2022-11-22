class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :status
      t.integer :rent_duration

      t.timestamps
    end
  end
end
