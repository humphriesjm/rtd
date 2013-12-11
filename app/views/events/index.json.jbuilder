json.array!(@events) do |event|
  json.extract! event, :title, :description, :points
  json.url event_url(event, format: :json)
end
