require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @meals
  end
  
  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find(id)
    @meals.find do |meal|
      meal.id == id
    end
    #@meals.find { |meal| meal.id == id }
  end
  
  private

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ["id","name","price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
      # Same as line below
      #@meals.each { |meal| csv << [meal.id, meal.name, meal.price] }
    end
  end
  
  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      id = row[0].to_i
      name = row[1]
      price = row[2].to_i
      meal = Meal.new({id: id, name: name, price: price})
      @meals << meal
    end
    if @meals.empty?
      @next_id = 1
    else
      @next_id = @meals.last.id + 1
    end
  end
end