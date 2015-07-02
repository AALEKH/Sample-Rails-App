class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]


  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end


  # POST /authentications
  # POST /authentications.json
  def create
    #@authentication = Authentication.new(authentication_params)
    @authentication = Authentication.new(:name => params["username"])
    #respond_to do |format|
      #if 
    @authentication.save
    #session[:hello] = params[:authentications]["username"]
    session[:hello] = @authentication.id
    #redirect_to :controller => 'file_uploads', :action => 'index'
    #redirect_to file_uploads
    redirect_to "/file_uploads" 
        #format.html { redirect_to @authentication, notice: 'Authentication was successfully created.' }
        #format.json { render :show, status: :created, location: @authentication }
      #else
      #  format.html { render :new }
      #  format.json { render json: @authentication.errors, status: :unprocessable_entity }
      #end
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentications).permit(:username)
    end
end

