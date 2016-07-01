json.array!(@moves) do |move|
  json.extract! move, :id, :title, :transportation, :distance, :time, :journal_id
  json.url move_url(move, format: :json)
end
