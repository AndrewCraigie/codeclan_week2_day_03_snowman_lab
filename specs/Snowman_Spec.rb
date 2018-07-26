require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../snowman')
require_relative ('../game')
require_relative ('../player')
require_relative ('../hidden_word')


class TestSnowman < MiniTest::Test

  $testing = true

  def setup()
    @player = Player.new("Elsa of Arendelle")
    @hidden_word = HiddenWord.new("Let it go")
    @game = Game.new(@player, @hidden_word)
    @snowman = Snowman.new()
  end


  def test_outputs_welcome()
    output, error = capture_io do
      @snowman.output_welcome()
    end
    assert_equal("----------SNOWMAN----------\n                           \n           *****           \n          *      *         \n         *  O  O  *        \n         *    >    *       \n          *   -   *        \n           *******         \n     \\   *         *  /   \n      - *     @     *-     \n        *     @     *      \n        *     @     *      \n          *       *        \n            *****          \n                           \n" , output)
  end

  def test_game_prompts_for_player_name()
    output, error = capture_io do
      @snowman.display_player_name_prompt()
    end
    assert_equal("Enter your name player? ", output)
  end

  def test_get_player_name()
    result = @snowman.get_player_name()
    assert_equal('Elsa', result)
  end

  def test_snowman_creates_player()
    player = @snowman.make_player("Elsa")
    assert_equal("Elsa", player.name)
  end

  def test_displays_secret_word_prompt()
    output, error = capture_io do
      @snowman.display_secret_word_prompt()
    end
    assert_equal("Enter a word or phrase to guess? ", output)
  end

  def test_get_secret_word()
    result = @snowman.get_secret_word()
    assert_equal("rainbow", result)
  end

  def test_init_game()
    game = @snowman.init_game("Elsa", "rainbow")
    assert_equal(Game, game.class)
  end



end
