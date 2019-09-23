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
  end
end
