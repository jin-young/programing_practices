require 'observer'

class Ticker # Periodically fetch a stock price
  include Observable
  attr_accessor :price

  def initialize(symbol, price)
    @symbol = symbol
    @price = price
  end

  def run
    lastPrice = nil
    loop do
      @price = @price+Random.rand(11)
      print "Current price: #{price}\n"
      if @price != lastPrice
        changed # notify observers
        lastPrice = @price
        notify_observers(Time.now, @price)
      end
    end
  end
end

class Warner
  def initialize(ticker)
    ticker.add_observer(self) # all warners are observers
  end
end

class SMSAlert < Warner
  def update(time, price) # callback for observer
    print "--- #{time.to_s}: SMS Alert for price: #{price}\n"
  end
end

class EmailAlert < Warner
  def update(time, price) # callback for observer
    print "+++ #{time.to_s}: Email Alert Price changed to #{price}\n"
  end
end

ticker = Ticker.new("MSFT", 307)
SMSAlert.new(ticker)
EmailAlert.new(ticker)
ticker.run