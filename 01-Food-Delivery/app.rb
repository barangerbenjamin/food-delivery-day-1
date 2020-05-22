# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"

meal_csv = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)