require 'oystercard'
describe Oystercard do
  it 'can have/check balance' do
    expect(subject.balance).to eq(0)
  end
end
