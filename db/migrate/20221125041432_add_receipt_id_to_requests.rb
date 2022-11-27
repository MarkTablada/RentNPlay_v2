class AddReceiptIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :receipt_id, :integer
  end
end
