# frozen_string_literal: true

class Game
  def initialize
    # @board = Array.new(6) { Array.new(7) { 'placeholder' } }
    @board = create_board(7, 6)
  end

  def create_board(x_axis, y_axis, val = nil)
    board = Array.new(y_axis)
    y_axis.times do |row_index|
      board[row_index] = Array.new(x_axis)
      x_axis.times do |column_index|
        board[row_index][column_index] = val
      end
    end
    board
  end

  def position_empty?(x_axis, y_axis)
    @board[x_axis][y_axis].nil?
  end

end
