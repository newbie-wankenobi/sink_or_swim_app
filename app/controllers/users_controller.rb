class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find_by(params[:id])

  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
       if @user.save
         session[:user_id] = @user.id
         flash[:notice] = "You have successfully signed up!"
         redirect_to root_path
       else
         render 'new'
       end
    end

  def show
    @user = User.find_by(id: params[:id])
    @swim_sessions = @user.swim_sessions
    @swim_sessions_message = "Would you like to go for a swim?"
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :height, :weight, :born_on, :gender,  :email, :password, :password_confirmation)
    end

    def authenticate
      redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
    end

    def authorize
      @user = User.find(params[:id])
      redirect_to root_path if @user != current_user
    end
end

