# frozen_string_literal: true

require_relative 'cards'
require_relative 'player'
require_relative 'dealer_player'
class Main
  def initialize
    print "добрай день, введите ваше имя\n"\
    @name_player = gets.chomp
    print "добро пожаловать #{@name_player} \n"\
    "Cыграем!\n"\

    @player = Player.new(@name_player)
    @dealer = Player.new("Дилер")
    @game = Game.new(@player,@dealer)
  end

  def game_run
    puts ''
    puts 'делаем ставку по 10$ и выдаем по две карты'
    @game.start_game
    card_info(@player, @name_player)
    card_info_dealer(@dealer, 'Диллера')
    menu
    @game.result
    puts "выиграл #{@game.winner}"
    puts "ваш счет #{@player.money}, счет диллера #{@dealer.money}"
    @game.reset
    result
  end

  def card_info(player, name)
    print "Карты на руках y #{name}: "
    player.hand.init_cards.each {|card| puts card.name}
    print "текущий счет: #{player.hand.counting}"
    puts " В кошельке: #{player.money} $"
  end

  def card_info_dealer(player, name)
    print "Карты на руках y #{name}: "
    player.cards_player.each {puts "[*]"}
    print 'текущий счет: [???]'
    puts " В кошельке: #{player.money} $"
  end

  def menu
    print "что будем делать  ?\n"\
    "1. Пропустить \n"\
    "2. Добавить карту\n"\
    "3. Открыть карты\n"\

    puts 'введите ключ'
    namber_key = gets.chomp
    case namber_key
    when 1
      @game.skip
    when 2
      @game.take
    when 3
      @game.open_cards
    else
      puts 'данного ключа не сушествует'
      menu
    end
  end

  def result
    if @player.money.zero?
      puts 'вы банкрот, накопите нужную сумму, приходите снова)'
    elsif @dealer.money.zero?
      puts 'вы оставили диллера без штанов((('
    else
      game_run
    end
  end
end

main = Main.new
main.game_run
