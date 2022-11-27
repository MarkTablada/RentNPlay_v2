class AddReceiptStatusToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :receipt_status, :string
  end
end
