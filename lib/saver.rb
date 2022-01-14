require 'json'

class Saver
  def self.save_game(status)
    puts 'enter file name: '
    filename = "./saves/#{$stdin.gets.strip}.json"
    file = File.open(filename, 'w')
    file.write(JSON.dump(status))
    file.close
  end

  def self.load_game
    filename = ''

    loop do
      printf "enter file name\ninput >> "
      filename = "./saves/#{$stdin.gets.strip}.json"
      break unless !File.file?(filename) && (choice == 2)

      puts 'Files not found'
    end

    file = File.read(filename)
    @status = JSON.parse(file)
  end
end
