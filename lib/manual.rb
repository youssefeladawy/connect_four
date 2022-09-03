module Manual
  def manual
    <<~HEREDOC
      How to play Connect Four?

      Connect Four is a two-player connection board game,
      in which the players choose a piece and then take turns dropping colored tokens
      into a seven-column, six-row vertically suspended grid. The pieces fall straight down, occupying the lowest available space within the column.
      The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own pieces.
    HEREDOC
  end
end
