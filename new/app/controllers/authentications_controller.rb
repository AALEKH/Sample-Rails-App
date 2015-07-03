class AuthenticationsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
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
    session[:session_user_variable] = @authentication.id
    #redirect_to :controller => 'file_uploads', :action => 'index'
    #redirect_to file_uploads
    redirect_to file_uploads_path 
        #format.html { redirect_to @authentication, notice: 'Authentication was successfully created.' }
        #format.json { render :show, status: :created, location: @authentication }
      #else
      #  format.html { render :new }
      #  format.json { render json: @authentication.errors, status: :unprocessable_entity }
      #end
    #end
  end

end

