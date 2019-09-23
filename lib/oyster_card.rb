class OysterCard

  BALANCE_CAP = 90
  MINIMUM_FARE = 1 

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    @balance >=BALANCE_CAP ? raise("Maximum balance of #{BALANCE_CAP} reached") : @balance += amount
  end

  def touch_in
    raise "Fare exceeds available balance" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    deduct
    @in_journey = false
  end

  private 
  
  def deduct
    @balance -= MINIMUM_FARE
  end

end
