json.extract! game, :id, :owner_id, :name, :description, :release_date, :genre, :platform, :rent_rate, :max_rent_duration, :status, :created_at, :updated_at
json.url game_url(game, format: :json)
