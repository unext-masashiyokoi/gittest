json.array!(@issues) do |issue|
  json.extract! issue, :id, :subuject, :project_id, :estimated_hours, :assigned_to_id, :status_id
  json.url issue_url(issue, format: :json)
end
