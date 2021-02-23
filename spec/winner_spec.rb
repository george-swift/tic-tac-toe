require_relative '../lib/tic_tac_toe/winner'

describe FindWinner do
  let(:arr_winner) { [1, 1, 1, 0, 0, 0, 0, 0, 0] }
  let(:arr_loser) { [1, 0, 1, 0, 0, 0, 0, 0, 0] }

  describe '#game_over?' do
    context 'when a player makes a move it checks for a winning combination' do
      it "returns true if the player's moves equal one of the winning combinations" do
        expect(FindWinner.new.game_over?(arr_winner)).to be_truthy
      end
      it "doesn´t return true if the player's moves are not one of the winning combinations" do
        expect(FindWinner.new.game_over?(arr_loser)).not_to be_truthy
      end
    end
  end
end
