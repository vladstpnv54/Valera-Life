require './lib/game'
require 'json'
require 'stringio'

module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new(console_input)
    out = StringIO.new
    $stdout = out
    yield
    out.string.strip
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

RSpec.describe Game do
  describe '#choose_action!' do
    game = Game.new
    status = {
      'health' => 100,
      'mana' => 30,
      'happienss' => 5,
      'fatigue' => 0,
      'money' => 50
    }
    action_item = 1
    file = File.read('./config.json')
    action_hash = JSON.parse(file)
    arr_action = ['Go work']
    context 'Go work' do
      expected_status = { 'fatigue' => 70, 'happienss' => 0, 'health' => 100, 'mana' => 0, 'money' => 150 }
      it { expect(game.do_action!(status, action_item, action_hash, arr_action)).to eq expected_status }
    end
  end
  describe '#choose_action!' do
    game = Game.new
    file = File.read('./config.json')
    action_hash = []
    arr_action = []
    game.action_item = 0
    it 'Leaving the game' do
      expect do
        game.choose_action!(action_hash, arr_action).call(game.valera)
      rescue SystemExit
        nil
      end.to output("See you next time\n").to_stderr
    end
    it 'YOU DIED' do
      expect do
        file = File.read('./config.json')
        action_hash = JSON.parse(file)
        arr_action = []
        action_hash.each_key { |key| arr_action.push key }

        game.valera.status = {
          'health' => 5,
          'mana' => 30,
          'happienss' => 5,
          'fatigue' => 0,
          'money' => 1000
        }
        game.action_item = 4
        game.choose_action!(action_hash, arr_action)
      rescue SystemExit
        nil
      end.to output('').to_stderr
    end
  end
end
