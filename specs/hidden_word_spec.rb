require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../hidden_word')
require_relative ('../game')
require_relative ('../player')

class TestHiddenWord < MiniTest::Test

  def setup()
    @player = Player.new("John Doe")
    @hidden_word = HiddenWord.new("over the rainbow")
    @game = Game.new(@player,@hidden_word )
  end

  def test_has_word()
    assert_equal("over the rainbow", @hidden_word.word())
  end

  def test_guess_z_is_false()
    response = @hidden_word.check_letters("z")
    assert_equal(false, response)
  end

  def test_guess_a_is_true()
    response = @hidden_word.check_letters("a")
    assert_equal(true, response)
  end

  def test_hidden_word_displays()
    word_to_display = @hidden_word.show_word(@game.guessed_letters)
    assert_equal("**** *** *******", word_to_display)
  end

  def test_hidden_word_displays_correct_letters()
    word_to_display = @hidden_word.show_word(["a", "o", "z", "l"])
    assert_equal("o*** *** *a***o*", word_to_display)
  end

  

end
