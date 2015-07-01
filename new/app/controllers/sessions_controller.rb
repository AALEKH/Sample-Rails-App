class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    session[:hello] = session_params["username"]
    if Authentication.exists?(:username => session[:hello])
      redirect_to :controller => 'file_uploads', :action => 'index'
    else
      redirect_to :controller => 'authentications', :action => 'new'
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

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session.delete(session(:hello))
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
