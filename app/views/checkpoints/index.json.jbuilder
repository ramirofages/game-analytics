json.array!(@checkpoints) do |checkpoint|
  json.extract! checkpoint, :id, :number, :activationCount, :level_id
  json.url level_checkpoint_url(checkpoint.level,checkpoint, format: :json)
end
