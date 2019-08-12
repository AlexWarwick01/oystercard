require 'oystercard'
describe Oystercard do
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
  describe '#deduct' do
    it 'can take money off for transactions' do
      expect(subject.deduct(10)).to eq(subject.balance)
    end
  end
  describe '#touch_in' do
    it 'can touch in' do
      expect(subject.touch_in).to be true
    end

    it 'can check to see if user has touched in' do
      subject.deduct(15)
      expect{ subject.touch_in }.to raise_error "Insufficient balance"
    end
  end

  describe '#in_use' do
    it 'is initially not in use' do
      expect(subject).not_to be(:in_use)
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      subject.touch_in
      subject.touch_out(cost)
      expect(subject).not_to be(:in_use)
    end

    it 'correctly charges the user' do
      subject.touch_in
      subject.touch_out(cost)
      expect{ subject.touch_out(5)}.to change{@balance}.by(10)
    end
  end
end
