# Remember, you can include implementation code right here:
#
# i.e.
# class Game
#  ...
# end
#
class Player
  # Not exactly sure what the player class does
end

class Game
  attr_reader :players

  def initialize(*players)
    @players = players
  end

end


describe "Dominion" do
  let(:two_player_game) {Game.new(Player.new, Player.new)}
  let(:three_player_game) {Game.new(Player.new, Player.new, Player.new)}

  it "has a set of players" do
    two_player_game.players.count.should == 2
    three_player_game.players.count.should == 3
  end

  # For you :) thanks, this should be fun
  # it "has a starting deck for each player" do 
  #   two_player_game.player1.deck.count.should == 25
  # end

  # it "has a community deck" do 
  #   # Not sure about these values, it seems that there are different versions
  #   Game.community_deck.should == 50
  # end
end
