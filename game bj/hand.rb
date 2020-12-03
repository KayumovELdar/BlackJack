# frozen_string_literal: true

class Hand
  attr_accessor :init_cards, :score

  def initialize
    @init_cards = []
    @score = 0
  end

  def add_card(card)
    @init_cards << card
    counting(card)
  end

  def counting(card)
    case card.name
    when /[K1QJ]/ then @score += 10
    when /A/ then @score += 11
    when /[2-9]/ then @score += card.name[1].to_i
    end
    @score -= 10 if @score > 21 && ([card.name] & ['♣A', '♦A', '♥A', '♠A']) != ''
  end

  def reset
    @init_cards = []
    @score = 0
  end
end
