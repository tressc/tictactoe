require_relative "game"
require_relative "player"

if __FILE__ == $PROGRAM_NAME
  system "clear"

  puts "Player 1, what is your name?"
  name1 = gets.chomp

  system "clear"

  puts "Player 2, what is your name?"
  name2 = gets.chomp

  player1, player2 = Player.new(name1), Player.new(name2)

  response = nil
  while !response
    system "clear"
    puts "All moves must be in the following format: row, column"
    puts "For example: 2,3 would place a mark in the 2nd row, 3rd column"
    puts "Press 'enter' to start playing!"
    response = gets.chomp.downcase
  end

  Game.new(player1, player2).run
end
