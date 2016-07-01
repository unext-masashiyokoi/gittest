json.array!(@projects) do |project|
  json.extract! project, :id, :title, :content, :category_id, :start_datetime, :end_datetime
  json.url project_url(project, format: :json)
end
