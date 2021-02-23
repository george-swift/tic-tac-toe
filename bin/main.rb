#!/usr/bin/env ruby

# rubocop:disable Lint/LiteralInInterpolation, Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

require_relative '../lib/tic_tac_toe/player'
require_relative '../lib/tic_tac_toe/winner'

# Use getters to collect input from players
puts "Let's play tic-tac-toe!"
puts 'Enter your name player one'
name = gets.chomp
player_one = name
puts "Welcome #{player_one}, select either 'X' or 'O' as your marker"
marker = gets.chomp.upcase

# Validate input from the players
def validate_marker(player_one, marker)
  game_markers = %w[X O]
  return false unless game_markers.include? marker

  puts "#{player_one} selects #{marker}"
  true
end

while validate_marker(player_one, marker) == false
  puts "Oops! Wrong input. Select either 'X' or 'O' as your marker"
  marker = gets.chomp.upcase
end

# Create Player 1 object
player1_obj = Player.new(player_one, marker, Array.new(9, 0))

def change_marker(marker)
  other_marker = %w[X O].reject { |ch| ch == marker }
  other_marker[0]
end

puts 'Enter your name player two'
name = gets.chomp
player_two = name

# Create Player 2 object
player2_obj = Player.new(player_two, change_marker(marker), Array.new(9, 0))

puts "Welcome #{player2_obj.name}, your marker is #{player2_obj.marker}"

puts 'Remember: The player with a row, column or diagonal of the same marker wins'
puts "Ready? Let's begin!"

# Define the board layout
def board(moved_cells = %w[1 2 3 4 5 6 7 8 9])
  cells = moved_cells
  puts <<-GRID

                #{cells[0]} | #{cells[1]} | #{cells[2]}
               ---+---+---
                #{cells[3]} | #{cells[4]} | #{cells[5]}
               ---+---+---
                #{cells[6]} | #{cells[7]} | #{cells[8]}

  GRID
end

# Add the banner
def game_banner
  puts <<-GRID

        #######             #######               ########{'              '}
          #                   #                     ##{'                 '}
          #                   #                     ##{'                 '}
          #    ##   ####      #    ####   ####      #     ####   ####{'  '}
          #     #  #   #      #       #  #   #      #    ##  ## #   ##{' '}
          #     #  #          #    ####  #          #    #    # ######{' '}
          #     #  ##         #    #  #  ##         #    ##  ## ##{'     '}
         ###   ###  ####     ###   #####  ####     ###    ####   ####
  GRID
end

def accept_moves(player_one, player_two)
  cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  moves_done = 1
  game_banner # BANNER - to show ASCII TIC TAC TOE
  board(cells)

  check = FindWinner.new
  game_in_play = true

  while cells.any? { |n| n.is_a? Integer } && game_in_play

    # Checks if other player made a winning move
    if check.game_over? player_two.moves_arr
      game_in_play = false
      puts "Brilliant! #{player_two.name} wins!!"
      break
    end

    puts 'Select a number from the GRID to make your move.'
    puts "#{player_one.name}'s Turn : "
    marker_pos = gets.chomp.to_i - 1
    while position_available(marker_pos, player_one, player_two) == false
      puts 'Oops! Invalid input. Try Again.'
      marker_pos = gets.chomp.to_i - 1
    end
    # Holds player one's move
    player_one.moves_arr[marker_pos] = 1

    # Sends player_object.marker to DISPLAY GRID
    cells[marker_pos] = player_one.marker

    board(cells)

    # Checks if previous player made a winning move
    if check.game_over? player_one.moves_arr
      game_in_play = false
      puts "Brilliant! #{player_one.name} wins!!"
      break
    end

    unless board_is_full(cells)
      puts 'Select a number from the GRID to make your move.'
      puts "#{player_two.name}'s Turn : "
      marker_pos = gets.chomp.to_i - 1
      while position_available(marker_pos, player_one, player_two) == false
        puts 'Oops! Invalid input. Try Again.'
        marker_pos = gets.chomp.to_i - 1
      end
      # Holds player two's move
      player_two.moves_arr[marker_pos] = 1

      # Sends player marker to DISPLAY GRID
      cells[marker_pos] = player_two.marker

      board(cells)
    end

    break if moves_done > 8 == true

    moves_done += 1
  end

  puts "It's a Tie. Play again?" unless check.game_over? player_one.moves_arr or check.game_over? player_two.moves_arr
end

def board_is_full(cells)
  return true if cells.count { |x| x.is_a? Integer }.zero?

  false
end

# checks moves array for Player 1 & 2
# allow move position & returns true
# checks against moves array of both players
def position_available(marker_pos, player1_obj, player2_obj)
  # test - marker_pos - index has a limit of 1 to 9
  return false if marker_pos.negative? || (marker_pos > 8)

  # test - new move - does not overlap any previous moves done.
  return true if (player1_obj.moves_arr[marker_pos].zero? && player2_obj.moves_arr[marker_pos].zero?) == true

  false
end

accept_moves(player1_obj, player2_obj)
game_banner # BANNER - to show ASCII TIC TAC TOE

# rubocop:enable Lint/LiteralInInterpolation, Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
