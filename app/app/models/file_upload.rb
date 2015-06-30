class FileUpload < ActiveRecord::Base
	def self.save(upload)
    	name =  upload['datafile'].original_filename
    	directory = "/Users/browserstack/Desktop/Sample-Rails-App/uploads"
    	# create the file path
    	path = File.join(directory, name)
    	# write the file
    	File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  	end
end