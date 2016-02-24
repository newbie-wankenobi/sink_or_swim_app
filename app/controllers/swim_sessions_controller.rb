class SwimSessionsController <ApplicationController

  def index
    @swim_sessions = SwimSession.all
  end

end
