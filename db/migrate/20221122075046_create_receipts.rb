class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.integer :name
      t.integer :mobile_number
      t.string :house_number
      t.string :barangay
      t.string :city
      t.string :province
      t.integer :game
      t.integer :rent_rate
      t.date :start_date
      t.integer :rent_duration
      t.date :end_date
      t.integer :sub_total
      t.string :payment_method

      t.timestamps
    end
  end
end
