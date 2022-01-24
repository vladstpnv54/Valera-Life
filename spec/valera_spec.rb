require './lib/valera'

RSpec.describe Valera do
  describe '#dead?' do
    valera = Valera.new
    context 'Negative health - valera is dead' do
      status = {
        'health' => -5,
        'mana' => 30,
        'happienss' => 45,
        'fatigue' => 0,
        'money' => 1000
      }
      it { expect(valera.dead?(status)).to eq true }
    end
    context 'Valera is alive but values out of range' do
      status = {
        'health' => 120,
        'mana' => 250,
        'happienss' => 5,
        'fatigue' => -1,
        'money' => 50
      }
      it { expect(valera.dead?(status)).to eq false }
    end
    context 'Fatigue is greater than 100 - valera is dead' do
      status = {
        'health' => 30,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 250,
        'money' => 50
      }
      it { expect(valera.dead?(status)).to eq true }
    end
  end
end
