

class HiddenWord


  attr_reader :word, :solved

  def initialize(word)
    @word = word
    @solved = false
  end

  def check_letters(letter)
    @word.include?(letter)
  end

  def show_word(guessed_letters)

    show_word = @word.chars.map do |letter|
      if guessed_letters.include?(letter)
         letter
      else
        if letter == " "
           " "
        else
           "*"
        end
      end
    end
    show_word.join("")
  end

end
