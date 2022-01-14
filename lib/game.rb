require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class Game
  attr_accessor :action_item, :valera, :actions

  def initialize
    @valera = Valera.new
  end

  class << self
    attr_reader :actions
  end
  def do_action!(status, action_item, action_hash, arr_action)
    abort 'See you next time' if action_item.zero?
    selected_action_ = action_hash[arr_action[action_item - 1]]
    Actions.new.execute!(status, selected_action_)
  end

  def choose_action!(action_hash, arr_action)
    @valera.status = Saver.load_game if action_item == 9
    do_action!(@valera.status, @action_item, action_hash, arr_action)
    system('clear')
    @valera.fix_status!(@valera.status)
    return @valera = false if @valera.dead?(@valera.status)

    valera
  end

  def die_action
    abort 'Good luck' if action_item.zero?
    @valera = Valera.new if action_item == 1
  end
end
