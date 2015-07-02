class FileUploadsController < ApplicationController
  before_action :set_fileupload, only: [:show, :destroy]

  def index
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:hello])
    #binding.pry
  end

  def show
    #@aa = params[:file]
    if params[:id] == "shutdownSession"
      reset_session
      render :text => "End of session"
    else
      @file = FileUpload.where(id: params[:id], authentication_id: session[:hello])
      send_file @file[0][:filepath] + "/" + @file[0][:filename]
    end  
  end

  def destroy
    @file = FileUpload.where(id: params[:id], authentication_id: session[:hello])
    File.delete(@file[0][:filepath] + "/" + @file[0][:filename])
    FileUpload.destroy_all(id: params[:id])
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:hello])
    respond_to do |format|
      format.js {render "index"}
    end
    #redirect_to :controller => 'fileuploads', :action => 'index'
  end  

  def create
    FileUpload.saveFile(params[:upload])
    #params[:file].original_filename
    @name =  params[:upload]['datafile'].original_filename
    @directory = ENV["file-path"]
    @auth_id = session[:hello]
    FileUpload.create(filename: @name, filepath: @directory, authentication_id: @auth_id)
    redirect_to "/file_uploads" 
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fileupload
      #@fileupload = FileUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fileupload_params
      params.require(:fileupload).permit(:filename, :string)
    end
end