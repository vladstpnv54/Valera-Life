require './lib/saver'

RSpec.describe Saver do
  describe '#save_load_menu' do
    context 'Try save game' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }

      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.load_game
        curr_status = Saver.save_game(status)
        expect(curr_status).to eq nil
      }
    end
  end
end
