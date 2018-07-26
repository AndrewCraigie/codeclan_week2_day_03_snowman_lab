require_relative ('game')
require_relative ('player')
require_relative ('hidden_word')

class Snowman


  def initialize()
    @game = nil
  end

  def start()

    output_welcome()
    display_player_name_prompt()
    player_name = get_player_name()
    player = make_player(player_name)
    display_secret_word_prompt()
    secret_word = get_secret_word()

    @game = init_game(player, secret_word)
    @game.set_running(true)

    system 'clear'
    puts @game.hidden_word.show_word([])

    while @game.running

      guess = @game.get_player_guess()
      puts @game.hidden_word.show_word(guess)

    end

    @game.end_game()

  end

  def output_welcome()
    system 'clear'
    puts "----------SNOWMAN----------"
    puts ""
  end

  def display_player_name_prompt()
    print "Enter your name player? "
  end

  def get_player_name()
    return gets.chomp
  end

  def make_player(player_name)
    return Player.new(player_name)
  end

  def display_secret_word_prompt()
    print "Enter a word or phrase to guess? "
  end

  def get_secret_word()
    return gets.chomp
  end

  def init_game(player_name, secret_word)

    player = Player.new(player_name)
    hidden_word = HiddenWord.new(secret_word)
    return Game.new(player, hidden_word)
  end


end

snowman = Snowman.new()
snowman.start()
