json.array!(@campaigns) do |campaign|
  json.extract! campaign, :user_id, :title, :description, :target, :budget, :expiration, :image_url
  json.url campaign_url(campaign, format: :json)
end
