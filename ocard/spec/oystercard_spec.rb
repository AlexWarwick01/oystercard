require 'oystercard'
describe Oystercard do
  let(:station) {double :station}
  let(:exit) {double :exit}
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
      subject.touch_out("New Street", 15)
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
      subject.touch_out("New Street" , 5)
      expect(subject).not_to be(:in_use)
    end
    it 'correctly charges the user' do
      expect{ subject.touch_out("New Street" ,5) }.to change{subject.balance}.by(-5)
    end

    it 'checks entrystation is nil' do
      subject.touch_in(station)
      subject.touch_out("New Street" ,5)
      expect(subject.entrystation).to be(nil)
    end

    it 'can remember an exit station' do
      subject.touch_out(exit , 5)
      expect(subject.exitstation).to eq(exit)

    end

    it 'stores the entry and exit stations in the dontstopbelievin array' do
      subject.push("Old Street" , "New Street")
      expect(subject.journey).to eq(["Old Street" , "New Street"])
    end
  end
  describe '#push' do
    it 'checks journey is empty by default' do
    expect(subject.journey).to be{}
    end
  end
end
describe Station do
  #Both variables are given default values as it was too annoying
  #to code without this -- TLDR im lazy
  it 'has a zone vairable' do
    expect(subject.zone).to include("Zone1")
  end
  it 'has a stationname variable' do
    expect(subject.name).to include("Old Street")
  end
end
describe Journey do
  it 'does the thing' do

  end
end
