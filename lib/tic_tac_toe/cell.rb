# frozen_string_literal: true

module TicTacToe
  class Error < StandardError; end
  # Your code goes here...

  class Cell
    attr_accessor :value
    def initialize (value = "")
      @value = value
    end
  end
end