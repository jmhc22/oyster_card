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

  describe "Paying for a journey" do
    it "should deduct the fare from my balance" do
      subject.top_up(20)
      subject.deduct(5)
      expect(subject.balance).to eq 15
    end
  end

  describe "#touch_in" do
    it "should set the in journey status to true" do
      # subject.top_up(90)
      subject.touch_in
      expect(subject.in_journey).to eq true
    end
  end

  describe "#touch_out" do
    it "should set the in journey status to false" do
      # subject.top_up(90)
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end


end
