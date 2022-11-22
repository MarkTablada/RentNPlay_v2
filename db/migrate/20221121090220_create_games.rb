class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :owner_id
      t.string :name
      t.string :description
      t.date :release_date
      t.string :genre
      t.string :platform
      t.integer :rent_rate
      t.integer :max_rent_duration
      t.string :status

      t.timestamps
    end
  end
end
