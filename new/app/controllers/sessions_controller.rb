class SessionsController < ApplicationController
  
  skip_before_action :require_login, only: [:new, :create]
  # GET /sessions/new
  def new

  end


  # POST /sessions
  # POST /sessions.json
  def create

    if Authentication.exists?(:name => params["username"])
      @session_variable = Authentication.where(name: params["username"]).pluck(:id).first
      session[:session_user_variable] = @session_variable
      #redirect_to :controller => 'file_uploads', :action => 'index'
      redirect_to file_uploads_path 
    else
      redirect_to new_authentication_path
      #redirect_to :controller => 'authentications', :action => 'new'
    end  
    #@session = Session.new(session_params)

    #respond_to do |format|
    #  if @session.save
    #    format.html { redirect_to @session, notice: 'Session was successfully created.' }
    #    format.json { render :show, status: :created, location: @session }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @session.errors, status: :unprocessable_entity }
    #  end
    #end
  end
end
