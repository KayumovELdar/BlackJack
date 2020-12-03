# frozen_string_literal: true

require_relative 'cards'
class Deck
  attr_reader :cards_deck

  def initialize
    @card_deck = []
    Card::SUITS.each do |suits|
      Card::RANCS.each do |rancs|
        @card_deck << Card.new(suits + rancs)
      end
    end
  end

  def take_card
    @card_deck.pop
  end

  def shuffle_cards
    @card_deck.shuffle!
  end
end
