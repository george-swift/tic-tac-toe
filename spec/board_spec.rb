require_relative '../bin/main.rb'

describe board do
  # let(:cells) {%w[1 2 3 4 5 6 7 8 9]}
  let(:cells) {moved_cells}
  context 'When the palyer makes a move' do
    it "prints the player's marker in the selected position" do
      cells[0]='X'
      expect( board(cells)).to output(a_string_including('X')).to_stdout
    end
  end

end
