module Display
  def display_board(board)
    width = 4
    puts '| 1 || 2 || 3 || 4 || 5 || 6 || 7 |'
    puts '-----------------------------------'
    puts board.reverse.map { |row| row.map.with_index do |element, index|
      if element.is_a?(Integer)
        "| #{index + 1} |".rjust(width)
      else
        "| #{element} |".rjust(width)
      end
    end.join }
    # puts board.map { |row| row.map.with_index { |element, index| "| #{index} |".rjust(width) }.join }
    puts '-----------------------------------'
  end
end
