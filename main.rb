require_relative 'lib/player'
require_relative 'lib/game'

puts 'Connect 4 is ..'
game_pieces = ['⚪', '⚫']

puts 'Player 1 please enter your name'
p1_name = gets.chomp
p1_piece = game_pieces[0]
puts 'Player 2 please enter your name'
p2_name = gets.chomp
p2_piece = game_pieces[1]

player1 = Player.new(p1_name, p1_piece)
player2 = Player.new(p2_name, p2_piece)

Game.new(player1, player2).play
# use mixins
# give the user the ability to choose his own game piece?
