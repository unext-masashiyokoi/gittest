json.array!(@fishings) do |fishing|
  json.extract! fishing, :id, :title, :content, :fish, :count, :place, :time
  json.url fishing_url(fishing, format: :json)
end
