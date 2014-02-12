class Game

  def initialize
    @pins = [] 
  end

  def play pins
    @pins << pins
    @pins << 0 if pins == 10
  end

  def score
    total = 0

    @pins.each_with_index do |play, index|
      total += play
      total += play if spare? index
      total += @pins[index - 1] + @pins[index] if strike? index
    end

    total
  end

  private

  def strike? index

    index > 1 &&
      @pins[index - 3] == 0
    
  end

  def spare? index
    index > 1 &&
      @pins[index - 2] != 10 &&
      @pins[index - 1] + @pins[index - 2] == 10
  end

end
