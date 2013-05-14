# Remember, you can include implementation code right here:
#
# i.e.
# class Game
#  ...
# end
#
class Player
  # Not exactly sure what the player class does
  attr_reader :hand

  def initialize
    @hand = []
  end

  def deck
    [:estate] * 3 + [:bronze] * 7
  end

  def deal_hand
    @hand = deck.shuffle[0..4]
    @hand
  end

end

class Game
  attr_reader :players

  def initialize(*players)
    @players = players
  end

  def player1
    @players.first
  end

end


describe "Dominion" do
  let(:two_player_game) {Game.new(Player.new, Player.new)}
  let(:three_player_game) {Game.new(Player.new, Player.new, Player.new)}

  describe Game do
    it "has a set of players" do
      two_player_game.players.count.should == 2
      three_player_game.players.count.should == 3
    end

    it "starts with player1 making a turn " do 
      # This probably has to be broken up - Thanks!
      player1.hand = [:estate, :estate, :bronze, :bronze, :bronze]
      player1.play(:estate)
      player1.play(:bronze, :bronze, :bronze)
      player1.buy(:gold)
    end
  end

  describe Player do
    let(:player) { Player.new }
    it "has a starting deck for each player" do
      # Factor out to Player?  Law of Demeter?
      # Maybe like?
      # player.deck.count.should == 10
      two_player_game.player1.deck.count.should == 10
    end

    # Check out the README to give you ideas on what kind of tests to write
    it "can deal a hand from each deck" do
      player.deal_hand
      player.hand.count.should == 5
    end
  end


end
