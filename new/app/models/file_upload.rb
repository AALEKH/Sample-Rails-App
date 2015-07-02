class FileUpload < ActiveRecord::Base
	belongs_to :authentication
	def self.saveFile(upload)
      name =  upload['datafile'].original_filename
      directory = ENV["file-path"].to_s
      #binding.pry
      #directory = config.filepath
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    end 
end
