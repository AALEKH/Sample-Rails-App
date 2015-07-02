json.array!(@fileuploads) do |fileupload|
  json.extract! fileupload, :id, :filename, :filepath, :authentication_id
  json.url fileupload_url(fileupload, format: :json)
end
