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
    @deck = [:estate] * 3 + [:bronze] * 7
    @discard_pile = []
  end

  attr_reader :hand
  attr_accessor :deck
  attr_accessor :discard_pile

  def deal_hand
    @hand = deck[0..4]
    @hand
  end

  def play(*cards)
  end

  def buy(card)
    @deck << card
    true
  end

  def shuffle_deck
    @deck.shuffle
  end

  def finish
    @discard_pile = @hand
    @hand = []
    @discard_pile
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
  let(:player1) { Player.new }
  let(:player2) { Player.new }
  let(:two_player_game) {Game.new(player1, player2)}
  let(:three_player_game) {Game.new(Player.new, Player.new, Player.new)}

  describe Game do
    it "has a set of players" do
      two_player_game.players.count.should == 2
      three_player_game.players.count.should == 3
    end

    it "alternates turns after a player finishes his turn" do
      two_player_game.turn.should == player1
      player1.deal_hand
      player1.finish
      two_player_game.turn.should == player2
    end

  end

  describe Player do
    let(:player) { Player.new }
    it "has a starting deck for each player" do
      player.deck.count.should == 10
    end

    it "can buy a silver" do
      # I'm pretty sure we need to mock hand since we don't want setters on it
      player.stub(:hand, [:estate, :estate, :bronze, :bronze, :bronze])
      # player1.play(:estate) Can't play a victory card
      player.play(:bronze, :bronze, :bronze)
      player.buy(:silver) #silver costs 3, but it doesn't matter
      player.buy(:silver).should be_true
      player.deck.should include :silver
    end

    # No community cards yet, first get the basics working, then we'll
    # describe each type of card
    it "has a discard pile" do
      player.shuffle_deck # shuffle whole deck
      player.discard_pile.should be_empty
      player.deal_hand
      player.finish
      player.discard_pile.size.should == 5
    end

    # Check out the README to give you ideas on what kind of tests to write
    it "can deal a hand from each deck" do
      player.deal_hand
      player.hand.count.should == 5
    end

  end


end
