class SwimSessionsController <ApplicationController
  before_action :authenticate,      only: [:create, :destroy]
  before_action :autherize_create,  only: [:create]
  before_action :autherize_destroy, only: [:destroy]

  def index
    if params[:user_id]
      @users = User.find(params[:user_id])
      redirect_to user_path(@user) if @user == current_user
      @circuits = Circuit.search(params[:search]).where(user: @user)
      @swim_sessions = SwimSession.search(params[:search]).where(user: @user)
  else
    @circuits = Circuit.search params[:search]
  end
end

def show
     @swim_sessions = SwimSession.find(params[:id])
   end

# nested route /users/:user_id/mumbles
def create
  @swim_sessions = @user.swim_sessions.build(swim_sessions_params)

  if @swim_sessions.save
       flash[:notice] = "You have created a new swim session!"

    if params[:redirect]
      redirect_to params[:redirect]
    else
      redirect_to swim_sessions_path(@swim_sessions)
    end
  else
    render :"users/show"
  end
end

def destroy
  @swim_sessions.destroy
  redirect_to user_path(current_user)
end

private

  def swim_sessions_params
    params.require(:swim_sessions).permit(:text, :tags, :image_uri)
  end

  def authenticate
    redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
  end

  # nested route /users/:id/mumbles
  def authorize_create
   @user = User.find(params[:user_id])
   redirect_to root_path if @user != current_user
  end

  def authorize_destroy
   @swim_sessions = SwimSession.find(params[:id])
   redirect_to root_path if @swim_sessions.user != current_user
  end
end
