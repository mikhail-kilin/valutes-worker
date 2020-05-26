require "./lib/exchange_rate"

module CommandManager
  def all
    ExchangeRate.all.each do |elem|
      puts elem
    end
  end

  def value
    puts "Введите код"
    code = gets.chomp
    puts ExchangeRate.get_by_code(code)
  rescue NoMethodError
    puts "Неверный код, попробуйте еще раз"
    retry
  end

  def mult
    puts "Введите код"
    code = gets.chomp
    puts "Введите множитель"
    multiple = gets.chomp.to_f
    puts ExchangeRate.get_by_code(code).multiple(multiple)
  rescue NoMethodError
    puts "Неверный код, попробуйте еще раз"
    retry
  end
end
