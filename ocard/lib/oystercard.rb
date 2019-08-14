class Oystercard
  attr_reader :balance, :entrystation
  attr_accessor :in_use

  def initialize
    @balance = 15
    @in_use = false
    @entrystation = ""
  end

  def top_up(topup)
    fail "Transaction Exceeds Limit!" if @balance + topup >= 90
    @balance = @balance + topup
  end
  def touch_in(station)
    fail "Insufficient funds" if balance < 1
    @entrystation = station
  end
  def touch_out(cost)
    @entrystation = nil
    deduct(cost)
  end
  def in_use
    if entrystation == nil
      @in_use = false
    else
      @in_use = true
    end
  end

  private

  def deduct(cost)
     @balance = @balance - cost
  end
end
