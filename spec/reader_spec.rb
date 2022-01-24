require './lib/reader'

RSpec.describe Reader do
  describe '#read_action' do
    it 'Input choice by user' do
      game = Game.new
      expect do
        allow(game).to receive(:gets).and_return('2')
        expect(Reader.new.read_action(game)).to eq nil
      end
    end
  end
end
