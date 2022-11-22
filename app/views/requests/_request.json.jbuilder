json.extract! request, :id, :game_id, :user_id, :status, :rent_duration, :created_at, :updated_at
json.url request_url(request, format: :json)
