# frozen_string_literal: true

require_relative 'hand'
class Player
  attr_accessor :hand
  attr_reader :money, :name

  def initialize(name)
    @name = name
    @money = 100
    @hand = Hand.new
  end

  def take_money(money)
    @money -= money
  end

  def give_money(money)
    @money += money
  end
end
