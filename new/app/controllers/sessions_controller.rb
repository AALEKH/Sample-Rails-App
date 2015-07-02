class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update]

  # GET /sessions/new
  def new
    @session = Session.new
  end


  # POST /sessions
  # POST /sessions.json
  def create

    if Authentication.exists?(:name => params["username"])
      @session_variable = Authentication.where(name: params["username"]).pluck(:id)
      session[:hello] = @session_variable.join(',')
      #redirect_to :controller => 'file_uploads', :action => 'index'
      redirect_to "/file_uploads" 
    else
      redirect_to "/authentications/new"
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:username)
    end
end
