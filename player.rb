class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def request_move(request=nil)
    if request.nil?
      request = "#{self.name}, please choose a square to mark."
    end
    puts request
    input = gets.chomp.split(",")
    # subtract one to account for zero indexing
    input.map! { |coord| coord.to_i - 1 }
    if self.valid_input?(input)
      return input
    else
      self.request_move("Invalid move. Valid move example: 1,2")
    end
  end

  def valid_input?(input)
    if input.length != 2
      return false
    end
    input.all? do |coord|
      (0..2).include? coord.to_i
    end
  end
end
