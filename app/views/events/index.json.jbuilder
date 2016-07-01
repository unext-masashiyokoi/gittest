json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :start, :end, :place, :open_range
  json.url event_url(event)
end
