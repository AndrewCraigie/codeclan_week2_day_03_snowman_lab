class Game

  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def get_guessed_letters_count
    @guessed_letters.length
  end

  def reduce_player_life
    @player.lost_life
  end

  def get_player_guess()
    guess = @player.guess_letters()
    guess.chars.each {|letter| @guessed_letters.push(letter)}
  end

end
