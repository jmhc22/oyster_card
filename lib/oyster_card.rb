class OysterCard
  BALANCE_CAP = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance >=BALANCE_CAP ? raise("Maximum balance of #{BALANCE_CAP} reached") : @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
