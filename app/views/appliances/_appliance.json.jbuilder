json.extract! appliance, :id, :name, :category, :status, :description, :kitchen_id, :created_at, :updated_at
json.url appliance_url(appliance, format: :json)
