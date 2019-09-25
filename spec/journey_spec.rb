require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:station_a) { double :station_a }

  describe '#fare' do
    it 'a journey should have the maximum fare as a base' do
      expect(journey.fare).to eq Journey::MAXIMUM_FARE
    end
  end

  describe '#start_journey' do
    it 'starting a new journey saves the entry station to the route hash' do
      journey.start_journey(station_a)
      expect(journey.route[:entry_station]).to eq station_a
    end
  end

  describe '#end_journey' do
    it 'ending a new journey saves the exit station to the route hash' do
      journey.end_journey(station_a)
      expect(journey.route[:exit_station]).to eq station_a
    end
  end

end
