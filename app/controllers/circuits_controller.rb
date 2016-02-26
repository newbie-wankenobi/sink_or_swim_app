class CircuitsController<ApplicationController
  def index
    @circuits = Circuit.all
  end
  def show
    @circuits = Circuit.all
  end
end
