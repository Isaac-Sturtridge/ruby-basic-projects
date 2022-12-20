#implementing a stock picker method
# solution is On^2, to make it more efficient different data structures could be used to store the prices
# outside the scope of this function a little

# This array tracks the prices for one stock over a number of days
# Example is a very clear buy day 2 and sell day 3
EXAMPLE_STOCK_PRICES = [15, 12, 11, 96, 78, 73, 68, 53, 51, 66, 87, 32]
EXAMPLE_STOCK_PRICES_2 = [67, 79, 11, 12, 15, 18]
EXAMPLE_STOCK_PRICES_3 = [79, 31, 12, 41, 61, 43]
# specifically this 4th example results in a loss as the stock starts at a high and always decreases until at a low, it will pick the time with the lowest loss
EXAMPLE_STOCK_PRICES_4 = [78, 76, 53, 23, 2]
EXAMPLE_STOCK_PRICES_5 = [15, 90, 0, 43, 65, 78, 95]

def stock_picker(stock_prices)
    # make a 2D array and find the highest profit
    # tracking all possible profits (array), the max possible (best_profit) and the eventual day index of the buy day tor return(best_buy_point)
    profits = []
    best_profit = 0
    best_buy_point = 0
    stock_prices.each {|price|
        profits.push([])
        stock_prices.each {|price2|
            # only days where buy day is less than sell day are considered
           if stock_prices.index(price) < stock_prices.index(price2)
                profits[stock_prices.index(price)].push(price2 - price)
                # isolates the correct sub-array for later by finding the max profit across all days
                if price2 - price > best_profit
                    best_profit = price2 - price
                    best_buy_point = stock_prices.index(price)
                end
           end
        }
    }
    # search the sub-array to find the second day to return, the selling day
    best_sell_point = profits[best_buy_point].index(profits[best_buy_point].max) + best_buy_point + 1
    return [best_buy_point, best_sell_point]
end

p(stock_picker(EXAMPLE_STOCK_PRICES))
p(stock_picker(EXAMPLE_STOCK_PRICES_2))
p(stock_picker(EXAMPLE_STOCK_PRICES_3))
p(stock_picker(EXAMPLE_STOCK_PRICES_4))
p(stock_picker(EXAMPLE_STOCK_PRICES_5))