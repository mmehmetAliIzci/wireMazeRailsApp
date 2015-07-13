json.array!(@notices) do |notice|
  json.extract! notice, :id, :title, :date, :summary, :text, :active, :prior
  json.url notice_url(notice, format: :json)
end
