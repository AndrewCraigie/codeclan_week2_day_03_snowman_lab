class Game

  attr_reader :player, :hidden_word, :guessed_letters, :running

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
    @running = false
  end

  def get_guessed_letters_count
    @guessed_letters.length
  end

  def reduce_player_life
    @player.lost_life()
  end

  def get_player_guess()

    if @player.lives() > 0 && !@hidden_word.solved()

      @running = true
      guess = @player.guess_letters()
      guess.chars.each {|letter| @guessed_letters.push(letter)}
      reduce_player_life()


      system 'clear'

    else
      @running = false
    end

    return @guessed_letters

  end

  def set_running(bool)
    @running = bool
  end

  def end_game()
    p @player.name()
  end


end
