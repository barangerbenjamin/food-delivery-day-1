class View
  def display(array)
    array.each_with_index do |meal, index|
      puts "#{index +1} - #{meal.name}: #{meal.price}"
    end
  end

  def ask_for(question)
    puts "Give me " + question
    gets.chomp
  end
end