class OysterCard

  BALANCE_CAP = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    @balance >=BALANCE_CAP ? raise("Maximum balance of #{BALANCE_CAP} reached") : @balance += amount
  end

  def touch_in(entry_station)
    raise "Fare exceeds available balance" if @balance < MINIMUM_FARE
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out
    deduct
    @entry_station = nil
    @in_journey = false
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end

end
