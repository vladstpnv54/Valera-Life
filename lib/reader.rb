class Reader
  def read_action(game)
    loop do
      game.action_item = gets.chomp.to_i
      return unless game.action_item.negative? || (game.action_item > 9)

      puts('error, no such action')
    end
  end
end
