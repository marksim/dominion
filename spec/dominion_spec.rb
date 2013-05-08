# Remember, you can include implementation code right here:
#
# i.e.
# class Game
#  ...
# end
#
describe "Dominion" do
  it "has a set of players" do
    game = Game.new(
      Player.new,
      Player.new
    )
    game.players.count.should == 2
  end
end
