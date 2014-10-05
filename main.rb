puts "Select episode:"
require 'pstore'
$episodes = PStore.new('eps.pstore')
unless $episodes.transaction { $episodes[:eps] }
  $episodes.transaction { $episodes[:eps] = 1 }
end
while true

  puts '1) The First Turnabout'
  if $episodes.transaction { $episodes[:eps] } >= 2
    puts "2) Turnabout Sisters"
  end
  if (input = gets.chomp) == '1'
    turnab = 1
    break
  end
  if $episodes.transaction { $episodes[:eps] } >= 2 and input == '2'
    turnab = 2
    break
  end
end

if turnab == 1
  puts "1) New Game\n2) Continue"
  until (input = gets.chomp) == '1' or input == '2'
  end
  if input == '1'
    File.open('first.pstore', 'w').close
  end
  require_relative 'firstturn'
elsif turnab == 2
  puts "Turnabout Sisters will be available soon."
  gets
end