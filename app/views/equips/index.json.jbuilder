json.array!(@equips) do |equip|
  json.extract! equip, :id, :name, :detail, :date, :status, :priority, :bland, :price
  json.url equip_url(equip, format: :json)
end
