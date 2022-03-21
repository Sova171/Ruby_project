def fibs(n)
  arr = [0,1]
  if n == 1
    arr = [0]
  elsif n < 1
    puts "Fibs is more than 0"
  else
    until arr.length == n do
      arr.push(arr[-1]+arr[-2])
    end
    arr
  end
end

def fibs_rec(n,arr = [0,1])
  if n <= 2
    p arr
  else
    arr.push(arr[-1]+arr[-2])
    fibs_rec(n-1, arr)
  end
end

print fibs(8)
puts
fibs_rec(4)