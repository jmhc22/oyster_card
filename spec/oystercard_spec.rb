require 'oyster_card'

describe OysterCard do

  describe "New card is issued to a customer" do
    it "The card should have a zero balance" do
      expect(subject.balance).to eq 0
    end



  end

end
