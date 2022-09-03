# frozen_string_literal: true
require 'pry-byebug'

class Game
  attr_reader :board

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @players = [@p1, @p2]
    @board = Array.new(6) { Array.new(7) { |index| index + rand(30)} }
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
    return false if @board[x_axis][y_axis] == @p1.piece || @board[x_axis][y_axis] == @p2.piece

    true
  end

  def board_complete?
    # return true if @board.each { |row| row.none?(Integer)}
    check = @board.select { |row| row.none?(Integer) }
    return true if check.length == 6

    false
  end

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

  def draw?
    return true if board_complete? && !winner?

    false
  end

  def player_selection
    puts 'Pick where you want to play (between 1 and 7)'
    gets.chomp
  end

  def verify_input(input)
    return input if input.between?(1, 7)
  end

  def selection
    user_selection = nil
    until user_selection
      user_selection = verify_input(player_selection.to_i)
      puts 'You can only choose a number between 1 and 7' unless user_selection
    end
    user_selection
  end

  # Fixes Edge case that makes the #set_piece method
  # accepts values in columns even after they are full
  def column_full?(column)
    full = true
    @board.each_index do |row_index|
      break if full == false

      full = false if @board[row_index][column].is_a?(Integer)
    end
    full
  end

  def set_piece(piece)
    user_column_to_play_in = selection - 1

    while column_full?(user_column_to_play_in)
      puts 'column is full'
      user_column_to_play_in = selection - 1
    end

    @board.each_index do |row|
      next unless position_empty?(row, user_column_to_play_in)

      @board[row][user_column_to_play_in] = piece if position_empty?(row, user_column_to_play_in)

      break unless position_empty?(row, user_column_to_play_in)
    end
  end
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
