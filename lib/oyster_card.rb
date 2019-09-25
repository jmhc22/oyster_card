require_relative 'journey'
require_relative 'station'

class OysterCard

  BALANCE_CAP = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :journey, :journey_history

  def initialize
    @balance = 0
    @journey = nil
    @journey_history = []
  end

  def top_up(amount)
    @balance >=BALANCE_CAP ? raise("Maximum balance of #{BALANCE_CAP} reached") : @balance += amount
  end

  def touch_in(entry_station)
    raise "Fare exceeds available balance" if @balance < MINIMUM_FARE
    double_touch_in unless @journey == nil
    new_journey_obj(entry_station)
  end

  def touch_out(exit_station)
    no_touch_in if @journey == nil
    @journey.end_journey(exit_station)
    deduct(@journey.fare)
    save_journey
  end

  private

  def deduct(fare = MINIMUM_FARE)
    @balance -= fare
  end

  def double_touch_in
    @journey.no_exit
    deduct(@journey.fare)
    save_journey
  end

  def no_touch_in
    @journey = Journey.new
    @journey.no_entry
  end

  def new_journey_obj(entry_station)
    @journey = Journey.new
    @journey.start_journey(entry_station)
  end

  def save_journey
    @journey_history << @journey
    @journey = nil
  end

end
