require_relative 'game'
require_relative 'menu'
require_relative 'reader'
require 'json'

class Application
  def initialize
    @game = Game.new
    @menu = Menu.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def open_config
    file = File.read('config.json')
    JSON.parse(file)
  end

  def action_array(action_hash)
    arr_action = []
    action_hash.each_key { |key| arr_action.push key }
    arr_action
  end

  def run
    action_hash = open_config
    arr_action = action_array(action_hash)
    loop do
      print "\t\t\tValera stats\n"
      print "\t\tHP: #{@valera.status['health']}\t\t"
      print "Mana: #{@valera.status['mana']}\n"
      print "\t\thappienss: #{@valera.status['happienss']}\t"
      print "Fatigue: #{@valera.status['fatigue']}\n"
      print "\t\t\tMoney: #{@valera.status['money']}\n\n"

      @menu.print_actions
      @reader.read_action(@game)
      @valera = @game.choose_action!(action_hash, arr_action)

      next unless @valera == false

      @menu.print_died
      @reader.read_action(@game)
      @valera = @game.die_action
    end
  end
end

Application.new.run
