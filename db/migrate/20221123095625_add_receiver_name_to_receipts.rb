class AddReceiverNameToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :receiver_name, :string
  end
end
