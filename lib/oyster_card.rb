class OysterCard

  BALANCE_CAP = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    @balance >=BALANCE_CAP ? raise("Maximum balance of #{BALANCE_CAP} reached") : @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


end
