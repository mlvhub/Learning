require "minitest/autorun"
require "tictactoe/game"

describe TicTacToe::Game do

  before do
    @game = TicTacToe::Game.new
  end

  it "begins with no plays" do
    @game.draw.must_equal <<-game
...
...
...
game
  end

  it "allows a player to mark a square" do
    @game.play 0, 0
    @game.draw.must_equal <<-game
x..
...
...
game
  end

  it "allows a second player to mark a square" do
    @game.play 0, 0
    @game.play 1, 0
    @game.draw.must_equal <<-game
xo.
...
...
game
  end




end
