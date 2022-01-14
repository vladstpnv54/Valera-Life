require_relative 'valera'

class Menu
  def initialize
    file = File.read('config.json')
    action_hash = JSON.parse(file)
    @arr_action = []
    action_hash.each_key { |key| @arr_action.push key }
  end

  def print_actions
    print "\t\tValera actions\n"
    @arr_action.map.with_index { |action, i| print "\t\t[#{i + 1}] - #{action}\n" }
    print "\t\t[0] - Exit\n"
    print 'Your action: '
  end

  def print_died
    print "\t\tYou DIE, play new game or quit?\n"
    print "\t\t1 - New game\n"
    print "\t\t0 - Quit\n"
    print 'Your choose: '
  end
end
