json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :image, :user_id, :religion_id
  json.url post_url(post, format: :json)
end
