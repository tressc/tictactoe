require_relative "board"

class Game
  attr_accessor :board
  attr_reader :players, :turn

  def initialize(board = Board.new, player1, player2)
    @board = board
    @players = {
      :X => player1,
      :O => player2
    }
    @turn = :X
  end

  def run
    while !self.board.game_over?
      system "clear"
      current_player = players[@turn]
      self.renderBoard
      move = current_player.request_move
      while !valid?(move)
        # ask for player input until valid move is received
        move = current_player.request_move("Invalid move. Please try again.")
      end
      self.board[move] = @turn
      self.switch_turn
    end

    system "clear"
    self.renderBoard

    if self.board.won?
      puts players[self.board.winner].name + " has won!"
    else
      puts "Cat's game!"
    end

    response = nil
    puts "Play again? (y/n)"
    while ! response
      response = gets.chomp
      if response == "y"
        self.board = Board.new
        self.run
      elsif response == "n"
        return
      else
        system "clear"
        puts "Please enter either 'y' or 'n'."
        response = nil
      end
    end
  end

  def renderBoard
    self.board.grid.each_with_index do |row, i|
      if i % 2 == 1
        puts "___________"
        puts
        self.renderRow(row)
        puts
        puts "___________"
        puts
      else
        self.renderRow(row)
        puts
      end
    end
  end

  def renderRow(row)
    row.each_with_index do |col, i|
      if col.nil?
        col = " "
      end
      if i % 2 == 1
        print "|"
        print " #{col} "
        print "|"
      else
        print " #{col} "
      end
    end
  end

  def valid?(move)
    self.board.blank?(move)
  end

  def switch_turn
    if @turn == :X
      @turn = :O
    else
      @turn = :X
    end
  end
end
