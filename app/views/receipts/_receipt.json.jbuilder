json.extract! receipt, :id, :name, :mobile_number, :house_number, :barangay, :city, :province, :game, :rent_rate, :start_date, :rent_duration, :end_date, :sub_total, :payment_method, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
