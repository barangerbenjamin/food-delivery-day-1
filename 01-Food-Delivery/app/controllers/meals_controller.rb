require_relative "../views/view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end
  
  def list
    meals = @meal_repository.all
    @view.display(meals)
  end
  
  def add
    name = @view.ask_for("name")
    price = @view.ask_for("price").to_i
    meal = Meal.new({name: name, price: price})
    @meal_repository.add(meal)
  end
  
end