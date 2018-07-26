
class Player

  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 6
  end

  def guess_letters()
    print "Enter your guess: "
    return gets.chomp
  end

  def lost_life
    @lives -= 1
  end

end
