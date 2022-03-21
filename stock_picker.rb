def stock_picker(mas)
  buble = mas.sort
  profit = 0
  result_mas = Array.new
  mas.each do |max|
    buble.each do |min|
      if min<max && mas.index(max) - mas.index(min) > 0
        result = max - min
        if profit < result
        profit = result
        result_mas = [mas.index(min), mas.index(max)]
        end
      end
    end
  end
  result_mas
end

mas = [17,3,6,9,15,8,6,1,10]
print stock_picker(mas)
#puts mas.sort