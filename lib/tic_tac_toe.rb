# frozen_string_literal: true

require_relative "tic_tac_toe/version"
require_relative "tic_tac_toe/cell"


module TicTacToe
  class Error < StandardError; end
  # Your code goes here...

  cell_1 = Cell.new("1")
  puts cell_1.value
end
