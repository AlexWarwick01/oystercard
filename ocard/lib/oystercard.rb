class Oystercard
  attr_reader :balance, :entrystation, :exitstation, :journey
  attr_accessor :in_use

  def initialize
    @balance = 15
    @in_use = false
    @entrystation = ""
    @exitstation = ""
    @journey = {}
  end
  def push(entrystation , exitstation)
    @journey = entrystation , exitstation
  end
  def top_up(topup)
    fail "Transaction Exceeds Limit!" if @balance + topup >= 90
    @balance = @balance + topup
  end
  def touch_in(station)
    fail "Insufficient funds" if balance < 1
    @exitstation = nil
    @entrystation = station
  end
  def touch_out(exit, cost)
    @exitstation = exit
    push(entrystation, exitstation)
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


class Station
attr_reader :zone , :name
def initialize
  @zone = "Zone1"
  @name = "Old Street"
end
end

class Journey
  def initialize

  end
end
