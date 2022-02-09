json.extract! event, :id, :event_id, :event_type, :name, :data, :start_time, :end_time, :location, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
