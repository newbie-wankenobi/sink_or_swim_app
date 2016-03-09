class SwimSessionsController <ApplicationController
  before_action :authenticate,      only: [:create, :destroy]
  before_action :authorize_create,  only: [:create]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @user = current_user
    @swim_sessions = SwimSession.all
  end

  def show
    @swim_sessions = SwimSession.find_by(id: params[:id])
  end

  def new
    @swim_session = SwimSession.new
  end

  def create
    @swim_sessions = @user.swim_sessions.new(swim_sessions_params)

    if @swim_sessions.save
       flash[:notice] = "You have created a new swim session!"
      if params[:redirect]
        redirect_to params[:redirect]
      else
        redirect_to swim_sessions_path(@swim_sessions)
      end
    else
      flash[:alert] = "Creating swim session failed!"
      render :new
    end
  end

  def destroy
    @swim_sessions = SwimSession.find(params[:id])
    @swim_sessions.destroy
    redirect_to swim_sessions_path
  end

private

  def swim_sessions_params
    params.require(:swim_session).permit(:location, :pool_length, :date, :minutes_long, :user_id)
  end

  def authenticate
    redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
  end

  def authorize_create
   @user = User.find(current_user.id)
   redirect_to root_path if @user != current_user
  end

  def authorize_destroy
   @swim_sessions = SwimSession.find(params[:id])
   flash[:message] = "You do not have access to this session."
   redirect_to swim_sessions_path if @swim_sessions.user != current_user
  end
end
