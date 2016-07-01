json.array!(@statuses) do |status|
  json.extract! status, :id, :title, :detail
  json.url status_url(status, format: :json)
end
