require "tictactoe/game"

game = TicTacToe::Game.new({ :color => true })

game.play 0, 0
game.play 1, 0

puts game.draw
