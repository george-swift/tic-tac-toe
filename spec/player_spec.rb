require_relative '../lib/tic_tac_toe/player.rb'

describe Player do
  marker = %w(X O)
  let(:block) { proc { |n| n.odd? } }
  let(:player) { Player.new('player', marker.sample, Array.new(9, 0)) }

  context 'when a player chooses a marker' do
    it 'checks that the selected marker is either X or O' do
      expect(player.marker).to eq('X').or eq('O')
    end
  end

  context 'before a player makes a move' do
    it 'initialises an array with zeroes as values to hold all possible selections' do
      expect(player.moves_arr).to eq(Array.new(9, 0))
    end

    it 'initialises an array with only zeroes as values to hold possible selections' do
      expect(player.moves_arr).not_to eq(Array.new(9, 1))
    end
  end

  context 'when the player makes a move' do
    it 'replaces the value at selected position in the moves array with 1' do
      player.moves_arr[3] = 1
      expect(player.moves_arr.any?(&block)).to be_truthy
    end

    it 'confines the number of moves each player between 0 and the total number of positions' do
      expect(player.moves_arr.length).not_to be < 0
    end

    it 'confines the number of moves each player to the total number of positions' do
      expect(player.moves_arr.length).to eq(9)
    end
  end
end


