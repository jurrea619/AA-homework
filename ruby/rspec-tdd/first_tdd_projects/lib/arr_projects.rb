
# my_uniq method returns new array with only unique elements in order which they appear
def my_uniq(arr)
    new_arr = []    # [1,2,1,4,3,3,6]
    # iterate through each el, add to new_arr if not already contained
    arr.each do |el|
        new_arr << el unless new_arr.include?(el)
    end
    new_arr
end

# two_sum method finds all pairs of positions where elements at
# those positions sum to zero
def two_sum(arr)
    pairs = []
    #iterate through all array elements
    arr.each_with_index do |el, idx|
        # iterate forward only to avoid repeating pairs
        (idx+1...arr.length).each do |next_idx|
            pairs << [idx, next_idx] if (el + arr[next_idx] == 0)
        end
    end
    pairs
end

# my_transpose converts between row-oriented and column-oriented representations
def my_transpose(arr)
    # check array length, needed to build correct size of matrix
    size = arr.length
    transposed = Array.new(size) { Array.new }
    # iterate though each row. Element index in given row is idx of new row
    arr.each do |row|
        row.each_with_index do |el,idx|
            transposed[idx] << el
        end
    end
    # return transposed matrix
    transposed
end

# stock_picker method takes array of stock prices (days 0,1,...) and outputs
# most profitable pair of days on which to first buy and then sell the stock
def stock_picker(arr)
    best_pair = nil
    best_profit = 0

    # iterate through array
    arr.each_index do |buy_date|
        arr.each_index do |sell_date|
            next if sell_date < buy_date
            # calc profit from current 2-day prices
            profit = arr[sell_date] - arr[buy_date]
            # if better than current best profit, set new best pair and profit
            if profit > best_profit
                best_pair = [buy_date, sell_date]
                best_profit = profit
            end
        end
    end
    best_pair
end