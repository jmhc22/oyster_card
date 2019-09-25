class Journey

  attr_reader :route, :fare
  MAXIMUM_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @route = { entry_station: nil, exit_station: nil }
    @fare = MAXIMUM_FARE

  end

  def start_journey(entry_station)
    @route[:entry_station] = entry_station
  end

  def end_journey(exit_station)
    @route[:exit_station] = exit_station
    calc_fare
  endgit 

  def no_exit
    end_journey("No touch out, maximum fare charged")
  end

  def no_entry
    start_journey("No touch in, maximum fare charged")
  end

  def calc_fare
    @fare = MINIMUM_FARE unless @route[:entry_station].is_a?(String) || @route[:exit_station].is_a?(String)
  end

end
