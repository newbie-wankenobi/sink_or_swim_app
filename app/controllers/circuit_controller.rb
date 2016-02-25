class CircuitController<ApplicationController

  def show
    @circuits = Circuit.all
  end
end
