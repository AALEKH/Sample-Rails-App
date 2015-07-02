json.array!(@people) do |person|
  json.extract! person, :id, :username, :string, :lastname, :string
  json.url person_url(person, format: :json)
end
