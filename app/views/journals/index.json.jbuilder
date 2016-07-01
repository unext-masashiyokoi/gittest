json.array!(@journals) do |journal|
  json.extract! journal, :id, :title, :time, :date
  json.url journal_url(journal)
end
