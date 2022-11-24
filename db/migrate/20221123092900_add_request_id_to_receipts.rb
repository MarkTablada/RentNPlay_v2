class AddRequestIdToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :request_id, :integer
  end
end
