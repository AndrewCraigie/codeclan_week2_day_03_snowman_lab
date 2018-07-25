require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../player')

class TestPlayer < MiniTest::Test

  def setup()
    @player = Player.new("Connie")
  end

  def test_has_name()
    assert_equal("Connie", @player.name())
  end

  def test_lives_are_6()
    assert_equal(6, @player.lives())
  end

  def test_player_gives_guessed_letter()
    letters_guessed = @player.guess_letters()
    assert_equal("over", letters_guessed)
  end

  def test_lost_life
    @player.lost_life
    assert_equal(5, @player.lives)
  end

end
