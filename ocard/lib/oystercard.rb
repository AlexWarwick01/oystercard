class Oystercard
  attr_reader :balance
  def initialize
    @balance = 15
    @in_use = false
  end
  def top_up(topup)
    fail "Transaction Exceeds Limit!" if @balance + topup >= 90
    @balance = @balance + topup
  end
  def deduct(remove)
    @balance = @balance - remove
  end
  def touch_in
    fail "Insufficient balance" if balance < 1
    @in_use = true
  end
  def used?
    @in_use = false
  end
  def touch_out(cost)
    @in_use = false
    @balance = @balance - cost
  end
end
