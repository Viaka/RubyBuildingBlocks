def bubble_sort (arr)
  arr.length.times do
    arr.each_with_index { |x, index|
      case arr[index] <=> arr[index+1] 
      when 1 
        arr[index], arr[index+1] = arr[index+1], arr[index] 
      else end 
    }
  end
puts ""
puts arr
return arr
end

def bubble_sort_by (arr)
    arr.each_index do |index|
    if block_given? && index < arr.length - 1
      if yield(arr[index], arr[index+1]) > 0 
        arr[index], arr[index+1] = arr[index+1], arr[index]
      end
    end
  end
puts ""
puts arr
return arr
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

bubble_sort([4,3,78,2,0,2])

