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
  def deduct(cost)
     @balance = @balance - cost
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
    deduct(cost)
  end
end
