json.extract! sign_in, :id, :user_id, :event_id, :signin_time, :created_at, :updated_at
json.url sign_in_url(sign_in, format: :json)
