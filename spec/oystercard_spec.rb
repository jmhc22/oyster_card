require 'oyster_card'

describe OysterCard do

  let(:station_a) { double :station_a }

  before(:each) do
    subject.top_up(20)
  end

  describe "New card is issued to a customer" do
    it "The card should have a zero balance" do
      subject = OysterCard.new
      expect(subject.balance).to eq 0
    end
  end

  describe '#top up' do
    it 'adds money to the card and returns the card balance' do
      initial_amount = subject.balance
      topup_amount = 10
      subject.top_up(topup_amount)
      expect(subject.balance).to eq initial_amount + topup_amount
    end

    it 'caps the balance at BALANCE_CAP' do
      subject.top_up(OysterCard::BALANCE_CAP)
      expect{subject.top_up(1)}.to raise_error("Maximum balance of #{OysterCard::BALANCE_CAP} reached")
    end
  end

  describe "#touch_in" do
    it "should set the in journey status to true" do
      subject.top_up(90)
      subject.touch_in(station_a)
      expect(subject.in_journey).to eq true
    end

    it "raises an error if card does not have required minimum balance" do
      subject = OysterCard.new
      expect{subject.touch_in(station_a)}.to raise_error("Fare exceeds available balance")
    end

    it "stores tap in station as a variable" do
      subject.touch_in(station_a)
      expect(subject.entry_station).to eq station_a
    end
  end

  describe "#touch_out" do
    it "should set the in journey status to false" do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end

    it 'reduces card balance by minimum fare' do
      subject.top_up(10)
      subject.touch_in(station_a)
      expect{subject.touch_out}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end

    it 'tapping out will reset entry station to nil' do
      subject.touch_in(station_a)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end


end
