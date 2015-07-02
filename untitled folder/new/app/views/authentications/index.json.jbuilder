json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :username
  json.url authentication_url(authentication, format: :json)
end
