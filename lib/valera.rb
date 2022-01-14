class Valera
  attr_accessor :status

  def initialize(health = 100, mana = 50, happienss = 5, money = 100, fatigue = 0)
    @status = {
      'health' => health,
      'mana' => mana,
      'happienss' => happienss,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def dead?(status)
    return true if check_gameover(status)

    false
  end

  def check_gameover(status)
    return true if status['health'].negative?
    return true if status['fatigue'] > 100

    false
  end

  def fix_status!(status)
    status['health'] = 100 if status['health'] > 100
    status['mana'] = 0 if (status['mana']).negative?
    status['mana'] = 100 if (status['mana']) > 100
    status['happienss'] = 10 if status['happienss'] > 10
    status['happienss'] = -10 if status['happienss'] < -10
    status['fatigue'] = 0 if (status['fatigue']).negative?
  end
end
