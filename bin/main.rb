# !/usr/bin/env ruby

# require_relative '../lib/tic_tac_toe'
# require_relative "../lib/player"

# Use getters to collect input from players
puts "Let's play tic-tac-toe!"
puts 'Enter your name player one'
name = 'P1' # gets.chomp
player_one = name
puts "Welcome #{player_one}, select either 'X' or 'O' as your marker"
marker = 'X' # gets.chomp.upcase

# Validate input from the players
def validate_marker(player_one, marker)
  game_markers = %w[X O]
  unless game_markers.include? marker
    puts "Oops! Wrong input. Select either 'X' or 'O' as your marker"
    marker = gets.chomp.upcase
  end
  "#{player_one} selects #{marker}"
end

puts validate_marker(player_one, marker)

# Create Player 1 object

def change_marker(marker)
  other_marker = %w[X O].reject { |ch| ch == marker }
  other_marker[0]
end

puts 'Enter your name player two'
name = 'P2' # gets.chomp
player_two = name
puts "Welcome #{player_two}, your marker is #{change_marker(marker)}"

# Create Player 2 object

puts 'Remember: The player with a row, column or diagonal of the same marker wins'
puts "Ready? Let's begin!"

# Define the board layout
def board(moved_cells = %w[1 2 3 4 5 6 7 8 9])
  cells = moved_cells
  puts 'Enter a number between 1 - 9 to select a position for your marker'
  puts <<-GRID

                #{cells[0]} | #{cells[1]} | #{cells[2]}
               ---+---+---
                #{cells[3]} | #{cells[4]} | #{cells[5]}
               ---+---+---
                #{cells[6]} | #{cells[7]} | #{cells[8]}

  GRID
end

def accept_moves(player_one, player_two)
  cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # count_unless_winning_combo = 1
  # move = 0
  moves_done = 1
  board(cells)
  while cells.any? { |n| n.is_a? Integer }
    puts 'Select a number from the GRID to make your move.'
    # accept player 1 move

    # if position_available?
    puts "#{player_one}'s Turn : "
    move = gets.chomp.to_i
    # end

    # reference player_object.marker
    cells[move - 1] = 'X'

    board(cells)

    unless board_is_full(cells)
      puts 'Select a number from the GRID to make your move.'
      # accept player 2 move

      # if position_available?
      puts "#{player_two}'s Turn : "
      move = gets.chomp.to_i
      # end

      # reference player_object.marker
      cells[move - 1] = 'O'

      board(cells)
    end

    break if moves_done > 8 == true

    moves_done += 1
  end

  puts "#{player_one} Wins!!! Or Draw"
end

def board_is_full(cells)
  return true if cells.count { |x| x.is_a? Integer }.zero?

  false
end

accept_moves(player_one, player_two)
