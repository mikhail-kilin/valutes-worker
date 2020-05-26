require "./lib/command_manager"

include CommandManager

help = "Чтобы получить информацию обо всех валютах, введи all;
чтобы узнать курс конкретной валюты, введи value;
чтобы узнать посчитать сколько рублей в твоем количестве валюты, введи mult;
чтобы выйти введи quit."
puts help
input = gets.chomp

while input != "quit"
  case input
  when "all"
    all
  when "value"
    value
  when "mult"
    mult
  else
    puts help
  end

  input = gets.chomp
end

puts "Пока)"
