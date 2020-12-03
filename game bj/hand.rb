# frozen_string_literal: true

class Hand
  attr_accessor :init_cards, :score

  def initialize
    @init_cards = []
  end

  def add_card(card)
    @init_cards << card
  end

  def counting
    score=0
    @init_cards.each do |card|
      case card.rancs
      when /[K1QJ]/ then score += 10
      when /A/ then score += 11
      else
        score += card.rancs.to_i
      end
      score -= 10 if score > 21 && card.rancs =='A'
    end
    return score
  end

  def reset
    @init_cards = []
    @score = 0
  end
end
