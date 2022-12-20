#implementing a stock picker method

# This array tracks the prices for one stock over a number of days
# Example is a very clear buy day 2 and sell day 3
EXAMPLE_STOCK_PRICES = [15, 12, 11, 96, 78, 73, 68, 53, 51, 66, 87, 32]
EXAMPLE_STOCK_PRICES_2 = [67, 79, 11, 12, 15, 18]
EXAMPLE_STOCK_PRICES_3 = [79, 31, 12, 41, 61, 43]
EXAMPLE_STOCK_PRICES_4 = [78, 76, 53, 23, 2]

def stock_picker(stock_prices)
    # find the greatest difference in the array
    # where the min has a lower index than the max
    buy_point = stock_prices.index(stock_prices.min)
    sell_point = stock_prices.index(stock_prices.max)
    if buy_point < sell_point
        # highest date is after lowest date, easy
        return [buy_point, sell_point]
    elsif buy_point == stock_prices[-1]

    else
        # in this situation we buy at the lowest point regardless and sell at the highest point after that
        # calculate the new max from days remaining
        sell_point = stock_prices.index(stock_prices[buy_point..-1].max)
        return [buy_point, sell_point]
    end
end

def stock_prices_test(stock_prices)
    # make a 2D array and find the highest profit
    profits = []
    stock_prices.each {|price|
        stock_prices.each {|price2|
            if stock_prices.index(price) < stock_prices.index(price2)
                profits.push(price2 - price)
            end
        }
    }
    return profits
end

p(stock_prices_test(EXAMPLE_STOCK_PRICES))