class OysterCard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(num)
    return @balance +=  num
  end
end
