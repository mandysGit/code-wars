=begin
Your task is to write a function that does just what the title suggests with an array/list/vector of integers and the expected number n of smallest elements to return.

- the number of elements to be returned cannot be higher than the array/list/vector length
- elements can be duplicated
- in case of duplicates, just return them according to the original order (see third example for more clarity)

Input: Array of Integers and an Integer `n`
Output: An Array of smallest `n` Integers

Problem: 
- Store Array in a 2D Array [[number, idx], [number, idx]]
- Get the n smallest Inetgers from the input Array, and their indexes
  - Sort by number
  - Slice off the Array from 0...n
- Sort by idx
- Store the numbers in a result array, Return the result

Algorithm:
  - Use Array#map Enumerable#with_index to iterate through input Array
  - Create 2D_array with each element as [number, idx]
  - Use Array#Sort_by, and sort by inner Array number
  - Use Array#Slice(0...n) Exclusive of n, to get n smallest numbers
  - use Array#Sort_by, and sort by idx
  - use Array#map to return Array with numbers
=end



def first_n_smallest(arr, n)
  new_array = arr.map.with_index do |num, idx|
    [num, idx]
  end

  ascending = new_array.sort_by { |inner_array| inner_array[0] }
  original_order = ascending.slice(0...n).sort_by { |inner_array| inner_array[1] }

  original_order.map { |inner_array| inner_array[0]}
end

# Same solution but written differently
def first_n_smallest(arr, n)
  arr.map.with_index{|v, i| [v,i]}
     .sort{|a,b| a[0] - b[0] || a[1] - b[1]}
     .slice(0, n)
     .sort{|a , b| a[1] - b[1]}
     .map{|v| v[0]}
end

p first_n_smallest([1,2,3,4,5],3) ==  [1,2,3]
p first_n_smallest([5,4,3,2,1],3) == [3,2,1]
p first_n_smallest([1,2,3,1,2],3) == [1,2,1]
p first_n_smallest([1,2,3,-4,0],3) == [1,-4,0]
p first_n_smallest([1,2,3,4,5],0) == []
p first_n_smallest([1,2,3,4,5],5) == [1,2,3,4,5]
p first_n_smallest([1,2,3,4,2],4) == [1,2,3,2]
p first_n_smallest([2,1,2,3,4,2],2) == [2,1]
p first_n_smallest([2,1,2,3,4,2],3) == [2,1,2]
p first_n_smallest([2,1,2,3,4,2],4) == [2,1,2,2]