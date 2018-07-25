require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../snowman')
require_relative ('../game')
require_relative ('../player')
require_relative ('../hidden_word')


class TestSnowman < MiniTest::Test

  def setup()
    @player = Player.new("Elsa of Arendelle")
    @hidden_word = HiddenWord.new("Let it go")
    @game = Game.new(@player, @hidden_word)
    @snowman = Snowman.new()
  end

  def test_snowman_can_output_welcome()
    output, error = capture_io do
      @game.output_welcome()
    end
    assert_equal("Hello I'm Snowman", output)
  end

end
