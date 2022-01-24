require './lib/actions'

RSpec.describe Actions do
  describe '#execute!' do
    context 'Go work' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      go_work_action = {
        'conds' => {
          'mana' => {
            'value' => '50',
            'operator' => '<'
          },
          'fatigue' => {
            'value' => '10',
            'operator' => '<'
          }
        },
        'effects' => {
          'happienss' => {
            'value' => '5',
            'operator' => '-'
          },
          'mana' => {
            'value' => '30',
            'operator' => '-'
          },
          'money' => {
            'value' => '100',
            'operator' => '+'
          },
          'fatigue' => {
            'value' => '70',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 70, 'happienss' => 0, 'health' => 100, 'mana' => 0, 'money' => 200 }
      it { expect(Actions.new.execute!(status, go_work_action)).to eq expected }
    end
    context 'See nature' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      see_nature_action = {
        'conds' => {

        },
        'effects' => {
          'happienss' => {
            'value' => '1',
            'operator' => '+'
          },
          'mana' => {
            'value' => '10',
            'operator' => '-'
          },
          'fatigue' => {
            'value' => '10',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 10, 'happienss' => 6, 'health' => 100, 'mana' => 20, 'money' => 100 }
      it { expect(Actions.new.execute!(status, see_nature_action)).to eq expected }
    end
    context 'See serial' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      see_serial_action = {
        'conds' => {

        },
        'effects' => {
          'health' => {
            'value' => '5',
            'operator' => '-'
          },
          'happienss' => {
            'value' => '1',
            'operator' => '-'
          },
          'mana' => {
            'value' => '30',
            'operator' => '+'
          },
          'money' => {
            'value' => '20',
            'operator' => '-'
          },
          'fatigue' => {
            'value' => '10',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 10, 'happienss' => 4, 'health' => 95, 'mana' => 60, 'money' => 80 }
      it { expect(Actions.new.execute!(status, see_serial_action)).to eq expected }
    end
    context 'Go to bar' do
      status = {
        'fatigue' => 0,
        'happienss' => 5,
        'health' => 100,
        'mana' => 30,
        'money' => 100
      }
      go_to_bar_action = {
        'conds' => {

        },
        'effects' => {
          'health' => {
            'value' => '10',
            'operator' => '-'
          },
          'happienss' => {
            'value' => '1',
            'operator' => '+'
          },
          'mana' => {
            'value' => '60',
            'operator' => '+'
          },
          'money' => {
            'value' => '100',
            'operator' => '-'
          },
          'fatigue' => {
            'value' => '40',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 40, 'happienss' => 6, 'health' => 90, 'mana' => 90, 'money' => 0 }
      it { expect(Actions.new.execute!(status, go_to_bar_action)).to eq expected }
    end
    context 'Drink with marginals' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      drink_with_matginals_action = {
        'conds' => {

        },
        'effects' => {
          'health' => {
            'value' => '80',
            'operator' => '-'
          },
          'happienss' => {
            'value' => '5',
            'operator' => '+'
          },
          'mana' => {
            'value' => '90',
            'operator' => '+'
          },
          'money' => {
            'value' => '150',
            'operator' => '-'
          },
          'fatigue' => {
            'value' => '80',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 80, 'happienss' => 10, 'health' => 20, 'mana' => 120, 'money' => -50 }
      it { expect(Actions.new.execute!(status, drink_with_matginals_action)).to eq expected }
    end
    context 'Sing' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      sing_action = {
        'conds' => {

        },
        'effects' => {
          'happienss' => {
            'value' => '1',
            'operator' => '+'
          },
          'mana' => {
            'value' => '10',
            'operator' => '+'
          },
          'money' => {
            'value' => '10',
            'operator' => '+',
            'conds' => {
              'mana' => {
                'value' => '70',
                'operator' => '<'
              }
            },
            'then' => {
              'value' => '50',
              'operator' => '+'
            }
          },
          'fatigue' => {
            'value' => '20',
            'operator' => '+'
          }
        }
      }
      expected = { 'fatigue' => 20, 'happienss' => 6, 'health' => 100, 'mana' => 40, 'money' => 150 }
      it { expect(Actions.new.execute!(status, sing_action)).to eq expected }
    end
    context 'Sleep' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      sleep_action = {
        'conds' => {

        },
        'effects' => {
          'health' => {
            'value' => '0',
            'operator' => '+',
            'conds' => {
              'mana' => {
                'value' => '30',
                'operator' => '<'
              }
            },
            'then' => {
              'value' => '90',
              'operator' => '+'
            }
          },
          'happienss' => {
            'value' => '0',
            'operator' => '+',
            'conds' => {
              'mana' => {
                'value' => '70',
                'operator' => '>'
              }
            },
            'then' => {
              'value' => '3',
              'operator' => '-'
            }
          },
          'mana' => {
            'value' => '50',
            'operator' => '-'
          },
          'fatigue' => {
            'value' => '70',
            'operator' => '-'
          }
        }
      }
      expected = { 'fatigue' => -70, 'happienss' => 5, 'health' => 100, 'mana' => -20, 'money' => 100 }
      it { expect(Actions.new.execute!(status, sleep_action)).to eq expected }
    end
    context 'Save' do
      status = {
        'health' => 100,
        'mana' => 30,
        'happienss' => 5,
        'fatigue' => 0,
        'money' => 100
      }
      save_action = { 'save' => {} }
      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        curr_status = Saver.load_game
        expect(Actions.new.execute!(curr_status, save_action)).to eq status
      }
    end
  end
end
