# module TicTacToe
  class Player
    attr_accessor :name, :marker, :moves_arr

    def initialize(name, marker, moves_arr)
      @name = name
      @marker = marker
      @moves_arr = moves_arr
    end
  end
# end
