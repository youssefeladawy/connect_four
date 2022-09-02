
require 'pry-byebug'


@board = [
          ["1", "6", "4", "9", "8", "1", "3"],
          ["2", "7", "5", "3", "7", "2", "4"],
          ["3", "8", "6", "1", "6", "8", "2"],
          ["4", "9", "1", "2", "9", "5", "9"],
          ["5", "1", "4", "8", "4", "7", "4"],
          ["1", "2", "7", "6", "3", "6", "2"]
]

column_index = 0
until column_index == @board.length
  @board.each_index do |row_index|
    binding.pry
    next if @board[row_index + 1].nil? || @board[row_index + 2].nil? || @board[row_index + 3].nil?
    next if @board[row_index + 1][column_index + 1].nil? || @board[row_index + 2][column_index + 2].nil? || @board[row_index + 3][column_index + 3].nil?
    return true if @board[row_index][column_index] == @board[row_index + 1][column_index + 1] && @board[row_index][column_index] == @board[row_index + 2][column_index + 2] && @board[row_index][column_index] == @board[row_index + 3][column_index + 3] 
    return true if @board[row_index][column_index] == @board[row_index + 1][column_index - 1] && @board[row_index][column_index] == @board[row_index + 2][column_index - 2] && @board[row_index][column_index] == @board[row_index + 3][column_index - 3]
    
    false
  end
  column_index += 1
end

# for every direction
#   for every coordinate
#       check whether the next 3 elements in this direction exist and are the same

# directions = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
# directions = [[1, 0], [0, 1], [1, -1], [1, 1]]

# directions.each do |direction|
#   row_movement = direction[0]
#   column_movement = direction[1]
#   column_index = 0
#   until column_index == @board.length
#     @board.each_index do |row_index|
#       @board[row_index]
#     end
#   end
# end