json.array!(@cycles) do |cycle|
  json.extract! cycle, :id, :title, :content, :time
  json.url cycle_url(cycle, format: :json)
end
