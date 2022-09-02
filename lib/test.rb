require 'pry-byebug'


@board = [
          ["ax", "lk", "6", "Xw", "8", "11", "15"],
          ["2", "dx", "s", "4", "gX", "5", "6"],
          ["5", "lp", "vx", "k", "3", "dX", "15"],
          ["d", "3", "11", "kx", "a", "2", "Xx"],
          ["1", "4", "9", "7", "13", "k", "1"],
          ["0", "7", "4", "4", "5", "13", "s"]
]

@board[5][0] = 'fp'
@board[4][1] = 'fp'
@board[3][2] = 'fp'
@board[2][3] = 'fp'

p @board

# this works but only for sequences that come after
sequence = 0
# counter = 0
column_i = 0


until column_i == @board.length
  break if sequence == 3

  sequence = 0
  @board.each_index do |row_i|
    counter = 0

    break if sequence == 3
    break if @board[row_i + 1].nil?
    break if @board[row_i + counter + 1].nil?
    
    x = @board[row_i + counter][column_i + counter] #[3][0]
    y = @board[row_i + counter + 1][column_i + counter + 1] #[4][1]
    while x == y
      break if sequence == 3
      break if @board[row_i + 1].nil?
      counter += 1
      sequence += 1
      break if @board[row_i + counter + 1].nil?

      x = @board[row_i + counter][column_i + counter] #[1][2]
      y = @board[row_i + counter + 1][column_i + counter + 1] #[2][3]
    end
  end
  column_i += 1
end

p 'winner' if sequence == 3

# sequence = 0
# column_index = 0

# until column_index == @board.length
#   break if sequence == 3

#   sequence = 0
#   @board.each_index do |row_index|
#     break if sequence == 3
#     break if @board[row_index + 1].nil?

#     binding.pry
#     if @board[row_index][column_index] == @board[row_index + 1][column_index + 1]
#       sequence += 1
#     else
#       sequence = 0
#     end
#   end
#   column_index += 1
# end
# p 'winner' if sequence == 3

# sequence = 0
# table.each_index do |index|
#   break if sequence == 3
#   break if table[index + 1].nil?

  
#   if table[index][index] == table[index + 1][index + 1]
#     sequence += 1
#   else
#     sequence = 0
#   end
# end

# p 'winner' if sequence == 3

# row = ['x', 'y', 'x', 'y', 'x', 'x', 'y']

# sequence = 0
# row.each_index do |i|
#   break if sequence == 3

#   if row[i] == row[i + 1]
#     sequence += 1
#   else
#     sequence = 0
#   end
# end
# p 'winner' if sequence == 3


# not_equal = false
# until not_equal
#   sequence = 0
#   row.each_index do |i|
#     binding.pry

#     not_equal = true if sequence == 4
#     break if sequence == 4

#     if row[i] == row[i + 1]
#       sequence += 1
#     else
#       sequence = 0
#     end
#   end
# end
