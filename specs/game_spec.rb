require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../game')
require_relative ('../player')
require_relative ('../hidden_word')


class TestGame < MiniTest::Test

  def setup()
    @player = Player.new("Jon Doe")
    @hidden_word = HiddenWord.new("over the rainbow")
    @game = Game.new(@player, @hidden_word)
  end

  def test_game_has_player
    assert_equal("Jon Doe", @game.player.name)
  end

  def test_game_has_hidden_word
    assert_equal("over the rainbow", @game.hidden_word.word)
  end

  def test_check_for_empty_array
    assert_equal(0, @game.get_guessed_letters_count)
  end

  def test_game_letter_true
    assert_equal(true, @hidden_word.check_letters("o"))
  end

  def test_game_letter_false
    assert_equal(false, @hidden_word.check_letters("z"))
  end

  def test_remove_life_false_letter
    @game.reduce_player_life
    assert_equal(5, @player.lives)
  end

  def test_check_lives
    assert_equal(6, @player.lives)
  end

  def test_hidden_word_solved_false()
    result = @hidden_word.solved()
    assert_equal(false, result)
  end

  def test_game_gets_guess_from_player
    @game.get_player_guess()
    count = @game.get_guessed_letters_count()
    assert_equal(4, count)
  end


end
