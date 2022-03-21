def bubble_sort(mas)
  for i in 0...mas.length
    for j in 0...mas.length
      if mas[j] > mas[i]
        temp = mas[i]
        mas[i] = mas[j]
        mas[j] = temp
      end
    end
  end
  mas
end
print bubble_sort([4,3,78,2,0,2])