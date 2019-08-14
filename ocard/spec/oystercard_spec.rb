require 'oystercard'
describe Oystercard do
  let(:station) {double :station}
  describe '#balance' do
    it 'can have/check balance' do
      expect(subject.balance).to eq(15)
    end
  end
  describe '#top_up' do
    it 'can add to balance' do
      expect(subject.top_up(10)).to eq(subject.balance)
    end
    it 'can throw an error if balance >= 90' do
      expect{ subject.top_up(90) }.to raise_error("Transaction Exceeds Limit!")
    end
  end

  describe '#touch_in' do

    it 'can check to see if user has touched in' do
      subject.touch_out(15)
      expect{ subject.touch_in("Old Street") }.to raise_error "Insufficient funds"
    end

    it 'can remember an entry station' do
      subject.touch_in(station)
      expect(subject.entrystation).to eq(station)

    end
  end

  describe '#used?' do
    it 'is initially not in use' do
      expect(subject).not_to be(:in_use)
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      subject.touch_out(5)
      expect(subject).not_to be(:in_use)
    end

    it 'correctly charges the user' do
      expect{ subject.touch_out(5) }.to change{subject.balance}.by(-5)
    end

    it 'checks entrystation is nil' do
      subject.touch_in(station)
      subject.touch_out(5)
      expect(subject.entrystation).to be(nil)
    end
  end
end
