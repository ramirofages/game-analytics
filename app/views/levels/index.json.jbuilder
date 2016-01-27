json.array!(@levels) do |level|
  json.extract! level, :id, :number, :checkpoint_id
  json.url level_url(level, format: :json)
end
