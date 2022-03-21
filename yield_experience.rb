module Enumerable
  def my_each
    for elem in self
      yield elem
    end
  end

  def my_each_with_index
    i = 0
    for elem in self
      yield elem, i
      i += 1
    end

    def my_select
      arr = []
      for elem in self
        arr.push(elem) if yield(elem) == true
      end
      arr
    end

    def my_all?
      status = true
      for elem in self
        status = false if yield(elem) != true
      end
      status
    end

    def my_any?
      status = false
      for elem in self
        status = true if yield(elem) == true
      end
      status
    end

    def my_none?
      status = true
      for elem in self
        status = false if yield(elem) == true
      end
      status
    end

    def my_count
      count = 0
      for elem in self
        count+=1 if yield(elem) == true
      end
      count
    end

    def my_map
      arr = []
      for elem in self
        arr.push(yield(elem))
      end
      arr
    end

    def my_inject(battery)
      for elem in self
        battery = yield(battery,elem)
      end
      battery
    end

  end
end

def multiply_els(array)
  array.my_inject(1){ |result, enum| result * enum }
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| print item }
numbers.each  { |item| print item }
puts
puts "my_each_with_index vs. each_with_index"
fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.each_with_index { |fruit, index| print fruit + " " if index.even? }
fruits.my_each_with_index { |fruit, index| print fruit + " " if index.even? }
puts
puts "my_select vs. select"
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p friends.select { |friend| friend != 'Brian' }
p friends.my_select { |friend| friend != 'Brian' }
puts "my_all? vs. all?"
fruits = ["a", "banana", "strawberry", "pineapple"]
p fruits.all? { |fruit| fruit.length > 3 }
p fruits.my_all? { |fruit| fruit.length > 3 }
puts "my_any? vs. any?"
numbers = [21, 42, 303, 499, 550, 811]
p numbers.any? { |number| number > 500 }
p numbers.my_any? { |number| number < 20 }
puts "my_none? vs. none?"
fruits = ["apple", "banana", "strawberry", "pineapple"]
p fruits.none? { |fruit| fruit.length > 10 }
p fruits.my_none? { |fruit| fruit.length > 10 }
puts "my_count? vs. count?"
ary = [1, 2, 4, 2]
p ary.count { |x| x%2 == 0 }
p ary.my_count { |x| x%2 == 0 }
puts "my_map vs. map"
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p friends.map { |friend| friend.upcase }
p friends.my_map { |friend| friend.upcase }
puts "my_inject vs inlect"
p [1, 2, 3, 4].inject(0) { |result, element| result + element }
p [1, 2, 3, 4].my_inject(0) { |result, element| result + element }
puts multiply_els([2,4,5])