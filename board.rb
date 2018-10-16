class Board
  attr_reader :grid

  WINNING_GROUPS = [
    [[0, 0],[0, 1],[0, 2]],
    [[1, 0],[1, 1],[1, 2]],
    [[2, 0],[2, 1],[2, 2]],
    [[0, 0],[1, 0],[2, 0]],
    [[0, 1],[1, 1],[2, 1]],
    [[0, 2],[1, 2],[2, 2]],
    [[0, 0],[1, 1],[2, 2]],
    [[0, 2],[1, 1],[2, 0]]
  ]

  def initialize
    # initialize board as 2d array of nil values
    @grid = Array.new(3) { Array.new(3) }
  end

  def [](pos)
    row, col = pos[0], pos[1]
    return @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos[0], pos[1]
    @grid[row][col] = mark
  end

  def blank?(pos)
    return self[pos].nil?
  end

  def full?
    return @grid.none? do |row|
      row.any? { |pos| pos.nil? }
    end
  end

  def winner
    WINNING_GROUPS.each do |group|
      if group.all? { |pos| self[pos] == "X" }
        return "X"
      elsif group.all? { |pos| self[pos] == "O" }
        return "O"
      end
    end
    # if no winner is found
    return nil
  end

  def won?
    # return boolean value
    return !!self.winner
  end

  def tied?
    self.full? && !self.won?
  end

  def game_over?
    self.tied? || self.won?
  end
end
