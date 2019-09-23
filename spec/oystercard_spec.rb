require 'oyster_card'

describe OysterCard do

  describe "New card is issued to a customer" do
    it "The card should have a zero balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top up' do
    it 'adds money to the card and returns the card balance' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'caps the balance at BALANCE_CAP' do
      subject.top_up(OysterCard::BALANCE_CAP)
      expect{subject.top_up(1)}.to raise_error("Maximum balance of #{OysterCard::BALANCE_CAP} reached")
    end
  end

  describe "#touch_in" do
    it "should set the in journey status to true" do
      subject.top_up(90)
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it "raises an error if card does not have required minimum balance" do
      expect{subject.touch_in}.to raise_error("Fare exceeds available balance")
    end
  end

  describe "#touch_out" do
    it "should set the in journey status to false" do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end

    it 'reduces card balance by minimum fare' do
      subject.top_up(10)
      subject.touch_in
      expect{subject.touch_out}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end

  end


end
