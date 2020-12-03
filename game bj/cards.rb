# frozen_string_literal: true

class Card
  attr_accessor :suit, :rancs

  SUITS = ['♥', '♦', '♣', '♠'].freeze
  RANCS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(rancs, suit)
    @rancs = rancs
    @suit = suit
  end
end
