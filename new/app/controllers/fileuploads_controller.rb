class FileUploadsController < ApplicationController
  before_action :set_file_upload, only: [:show, :destroy]

  def index
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:hello])
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
    #redirect_to :controller => 'file_uploads', :action => 'index'
    @arr = FileUpload.select(:id, :filename).where(authentication_id: session[:hello])
    respond_to do |format|
      format.js {render "index"}
    end
  end  

  def create
    FileUpload.saveFile(params[:upload])
    #params[:file].original_filename
    @name =  params[:upload]['datafile'].original_filename
    @directory = "/Users/browserstack/Desktop/Sample-Rails-App/uploads"
    FileUpload.create(filename: @name, filepath: @directory, authentication_id: session[:hello])
    #redirect_to :controller => 'file_uploads', :action => 'index'
    redirect_to(:action=>'index')
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_upload
      #@file_upload = FileUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_upload_params
      params.require(:file_upload).permit(:filename, :string)
    end
end