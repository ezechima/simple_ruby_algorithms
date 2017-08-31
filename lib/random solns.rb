def stock_picker(prices)
  day = 0
  max_profit = 0
  best_buy_date = 0
  best_sell_date = 0
  
  while day < prices.length
    buy = prices[day]
    (day..prices.length-1).each do |next_day|
      sell = prices[next_day]
      profit = sell - buy
    
      if profit > max_profit
        max_profit = profit
        best_buy_date = day+1
        best_sell_date = next_day+1
      end
    end
    day += 1
  end
  puts "For a max profit of #{max_profit} buy on day #{best_buy_date} and sell on day #{best_sell_date}."
end
def generate_int_array (size=9000,range=(1..10000))
  int_array = []
  rand_generator = Random.new(130)
  size.times do
    int_array.push(rand_generator.rand(range))
  end
  return int_array
end
puts Time.now      
stock_picker(generate_int_array)
puts Time.now
