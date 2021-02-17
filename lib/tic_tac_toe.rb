require_relative 'tic_tac_toe/version'
require_relative 'tic_tac_toe/cell'
require_relative 'tic_tac_toe/player'

module TicTacToe
  class Error < StandardError; end
  # Your code goes here...

  cell1 = Cell.new('1')
  puts cell1.value
end

# break if game_play(cells) == true
def game_play(cells)
  arr = []
  arr.append(cells.each do |x|
    x.instance_of?(Integer)
  end)
  return false unless arr.length > 1
end
