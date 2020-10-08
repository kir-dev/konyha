json.extract! user, :id, :uid, :email, :name, :floor, :created_at, :updated_at
json.url user_url(user, format: :json)
