require_relative 'deck'
require_relative 'player'

class Game

  attr_reader :winner

  def initialize(player, dealer)
    @player=player
    @dealer=dealer
  end

  def start_game
    @deck = Deck.new
    @deck.shuffle_cards
    give(@player, 2)
    give(@dealer, 2)
    @player.take_money(10)
    @dealer.take_money(10)
  end

  def give(person, namber)
    namber.times {person.hand.add_card(@deck.take_card)}
  end

  def skip
   dealer_logic
 end

 def take
   give(@player, 1)
   dealer_logic
 end

 def open_cards
 end

 def dealer_logic
   give(@dealer, 1) if @dealer.hand.score <= 17
 end

 def result

   if @player.hand.score == @dealer.hand.score || (@dealer@dealer.hand.score > 21 && @player.hand.score > 21)
     @player.give_money(10)
     @dealer.give_money(10)
     @winner="никто"
   elsif (@player.hand.score > @dealer.hand.score && @player.hand.score <= 21) || @dealer.hand.score > 21)
     @player.give_money(20)
     @winner=@player.name
   else
     @dealer.give_money(20)
     @winner=@dealer.name
   end
 end

  def reset
   @player.hand.reset
   @dealer.hand.reset
  end
end
