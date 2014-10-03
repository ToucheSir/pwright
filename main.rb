puts "Select episode:"
while true
  puts '1) The First Turnabout'
  if (input = gets.chomp) == '1'
    turnab = 1
    break
  end
end

if turnab == 1
  require_relative 'firstturn'
end