# frozen_string_literal: true

class Card
  attr_accessor :name

  SUITS = ['♥', '♦', '♣', '♠'].freeze
  RANCS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(name)
    @name = name
  end
end
