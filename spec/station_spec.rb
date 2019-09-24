require 'station'

describe Station do

subject(:station) {described_class.new("test_station", 6)}

  describe "#name" do
    it{ expect(station.name).to eq "test_station" }
  end

  describe "#zone" do
    it{ expect(station.zone).to eq 6 }
  end

end
