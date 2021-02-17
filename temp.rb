wins =  [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
moves_x = [0,0,0,0,0,0,0,0,0]
arr = []
moves_x.each_with_index { |val, index|
  if val == 1
    arr << index+1
  end
}
wins.any? { |x|
  x == arr
}

def position_available(move_pos)
  puts "Position:", move_pos
  unless ((player_1_Obj.moves_arr[move_pos] == 0) && (player_2_Obj.moves_arr[move_pos] == 0))
      puts "Oops1 The cell is taken. Try Again."
      move_pos = gets.chomp.to_i-1
  end
  true
end

position_available(gets.chomp.to_i-1)