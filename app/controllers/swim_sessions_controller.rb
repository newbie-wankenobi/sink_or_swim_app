class SwimSessionsController <ApplicationController

  def index
    @users = User.all
    @circuits = Circuit.all
    @swim_sessions = SwimSession.all
  end

end
