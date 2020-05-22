class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @meals_controller.list
  end
  
end
