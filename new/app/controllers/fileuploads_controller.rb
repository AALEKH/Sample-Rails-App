class FileUploadsController < ApplicationController

  def index
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:session_user_variable])
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
    #redirect_to :controller => 'file_uploads', :action => 'index'
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:session_user_variable])
    respond_to do |format|
      format.js {render "index"}
    end
  end  

  def create
    if params[:upload]['datafile'].original_filename == ""
      render :html => "<h1>Please upload file</h1>"
    else   
      FileUpload.saveFile(params[:upload])
      #params[:file].original_filename
      @name =  params[:upload]['datafile'].original_filename
      @directory = "/Users/browserstack/Desktop/Sample-Rails-App/uploads"
      FileUpload.create(filename: @name, filepath: @directory, authentication_id: session[:session_user_variable])
      #redirect_to :controller => 'file_uploads', :action => 'index'
      redirect_to(:action=>'index')
    end   
    #end
  end
end