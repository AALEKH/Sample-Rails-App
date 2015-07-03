class FileUploadsController < ApplicationController


  def index
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:session_user_variable])
    #binding.pry
  end

  def show
    #@aa = params[:file]
    if params[:id] == "shutdownSession"
      reset_session
      render :text => "End of session"
    else
      @file = FileUpload.where(id: params[:id], authentication_id: session[:session_user_variable])
      send_file @file[0][:filepath] + "/" + @file[0][:filename]
    end  
  end

  def destroy
    @file = FileUpload.where(id: params[:id], authentication_id: session[:session_user_variable])
    File.delete(@file[0][:filepath] + "/" + @file[0][:filename])
    FileUpload.destroy_all(id: params[:id])
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:session_user_variable])
    respond_to do |format|
      format.js {render "index"}
    end
    #redirect_to :controller => 'fileuploads', :action => 'index'
  end  

  def create
    if params[:upload] == nil
      render :html => "<h1>Upload file please</h1>"
    else
      FileUpload.saveFile(params[:upload])
      #params[:file].original_filename
      @name =  params[:upload]['datafile'].original_filename
      @directory = ENV["file-path"]
      @auth_id = session[:session_user_variable]
      FileUpload.create(filename: @name, filepath: @directory, authentication_id: @auth_id)
      redirect_to file_uploads_path
    end      
  end
end