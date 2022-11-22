json.extract! account, :id, :user_type, :username, :full_name, :email, :mobile_number, :created_at, :updated_at
json.url account_url(account, format: :json)
