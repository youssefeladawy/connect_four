# frozen_string_literal: true
require 'pry-byebug'


class Game
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) { |index| "#{index + rand(10)}" } }
    # @board = create_board(7, 6)
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
    # @board[x_axis][y_axis].nil?
    return false if @board[x_axis][y_axis] == 'x' || @board[x_axis][y_axis] == 'y'

    true
  end

  # def vertical_sequence?
  #   sequence = 0
  #   @board.each do |row|
  #     break if sequence == 3

  #     row.each_index do |i|
  #       break if sequence == 3
  #       break if row[i + 1].nil?

  #       if row[i] == row[i + 1]
  #         sequence += 1
  #       else
  #         sequence = 0
  #       end
  #     end
  #   end
  #   sequence == 3
  # end

  # def horizontal_sequence?
  #   sequence = 0
  #   column_index = 0
  #   until column_index == @board.length
  #     break if sequence == 3

  #     sequence = 0
  #     @board.each_index do |row_index|
  #       break if sequence == 3
  #       break if @board[row_index + 1].nil?

  #       if @board[row_index][column_index] == @board[row_index + 1][column_index]
  #         sequence += 1
  #       else
  #         sequence = 0
  #       end
  #     end
  #     column_index += 1
  #   end
  #   sequence == 3
  # end

  def vertical_sequence?
    column_index = 0
    until column_index == @board.length
      @board.each_index do |row_index|
        next if @board[row_index + 1].nil? || @board[row_index + 2].nil? || @board[row_index + 3].nil?
        next if @board[row_index + 1][column_index + 1].nil? || @board[row_index + 2][column_index + 2].nil? || @board[row_index + 3][column_index + 3].nil?
        return true if @board[row_index][column_index] == @board[row_index][column_index + 1] && @board[row_index][column_index] == @board[row_index][column_index + 2] && @board[row_index][column_index] == @board[row_index][column_index + 3]
      end
      column_index += 1
    end
    false
  end

  def horizontal_sequence?
    column_index = 0
    until column_index == @board.length
      @board.each_index do |row_index|
        next if @board[row_index + 1].nil? || @board[row_index + 2].nil? || @board[row_index + 3].nil?
        next if @board[row_index + 1][column_index + 1].nil? || @board[row_index + 2][column_index + 2].nil? || @board[row_index + 3][column_index + 3].nil?
        return true if @board[row_index][column_index] == @board[row_index + 1][column_index] && @board[row_index][column_index] == @board[row_index + 2][column_index] && @board[row_index][column_index] == @board[row_index + 3][column_index] 

        false
      end
      column_index += 1
    end
    false
  end

  def diagonal_sequence?
    column_index = 0
    until column_index == @board.length
      @board.each_index do |row_index|
        next if @board[row_index + 1].nil? || @board[row_index + 2].nil? || @board[row_index + 3].nil?
        next if @board[row_index + 1][column_index + 1].nil? || @board[row_index + 2][column_index + 2].nil? || @board[row_index + 3][column_index + 3].nil?
        return true if @board[row_index][column_index] == @board[row_index + 1][column_index + 1] && @board[row_index][column_index] == @board[row_index + 2][column_index + 2] && @board[row_index][column_index] == @board[row_index + 3][column_index + 3] 
        return true if @board[row_index][column_index] == @board[row_index + 1][column_index - 1] && @board[row_index][column_index] == @board[row_index + 2][column_index - 2] && @board[row_index][column_index] == @board[row_index + 3][column_index - 3]

        false
      end
      column_index += 1
    end
    false
  end

  def winner?
    return true if vertical_sequence?
    return true if horizontal_sequence?
    return true if diagonal_sequence?

    false
  end

  # def horizontal_sequence?
  #   sequence = 0

  #   @board.each_index do |index|

  #     break if sequence == 3
  #     break if @board[index + 1].nil?

  #     if @board[index][0] == @board[index + 1][0]
  #       sequence += 1
  #     else
  #       sequence = 0
  #     end
  #   end
  #   sequence == 3
  # end

  # def winner?
  #   @board.each do |row|
  #     not_equal = false
  #     until not_equal
  #       sequence = 0
  #       row.each_index do |i|
  #         not_equal = true if sequence == 4
  #         break if sequence == 4

  #         if row [i] == row[i + 1]
  #           sequence += 1
  #         else
  #           sequence = 0
  #         end
  #       end
  #       # row.select { |element| element == 'x'}
  #     end
  #   end
  # end

  # Player 1 Plays
  # Player 1 can play in only empty positions
  # Player 1 cant skip a row unless there is a piece in one of its columns
  # After playing check if player wins? if not > next player plays

  # how to tackle player playing in a position that shouldnt be available yet?
  # Well we can set an array of 7 elements which are 7 options for the user to select from
  # and once the user lets say picks 1 in the first turn
  # then the 1 in the next row will be available while the other 6 remains pointing to the first row

end

# Game.new.winner?