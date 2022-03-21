def merge(arr1, arr2,arr = [])
    if arr1.length == 0
      arr.concat(arr2.shift(arr2.length))
    elsif arr2.length == 0
      arr.concat(arr1.shift(arr1.length))
    else
      arr = arr1[0] < arr2[0] ? arr.push(arr1.shift) : arr.push(arr2.shift)
      merge(arr1,arr2,arr)
    end
    arr
  end

def merge_sort(array)
  if array.length < 2
    array
  else
    array1 = merge_sort(array[0...array.length/2])
    array2 = merge_sort(array[array.length/2...array.length])
    merge(array1,array2)
  end
end

p merge_sort([4,8,6,2,1,7,5,3])



