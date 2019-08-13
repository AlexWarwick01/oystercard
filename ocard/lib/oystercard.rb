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
  def touch_in
    fail "Insufficient balance" if balance < 1
    @in_use = true
  end
  def used?
    @in_use = false
  end
  def touch_out(cost)
    deduct(cost)
    @in_use = false
  end

  private

  def deduct(cost)
     @balance = @balance - cost
  end
end
