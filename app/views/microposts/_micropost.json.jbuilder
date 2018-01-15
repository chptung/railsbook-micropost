json.extract! micropost, :id, :content, :user_id, :created_at, :updated_at, :status, :publish_at, :published_at
json.url micropost_url(micropost, format: :json)
