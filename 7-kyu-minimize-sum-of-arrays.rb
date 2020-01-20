=begin
https://www.codewars.com/kata/5a523566b3bfa84c2e00010b

Given an array of integers, Find the minimum sum which is obtained from summing each Two integers product.

Notes:
- Array/list will contain positives only
- Array/list will always has even size

Problem:
- Given an Array of Integers
- Two pairs of integers are multiplied together (largest * smallest)
- Sum up all the products of pair of integers

Input: Array of Integers
Output: Integer

Algo: 
- Rearrange the Integers from descending order
  - Use Array#sort, b <=> a
  
- Create a set of products (N*M), largest integers * smallest integers
  - initialize products = []
  - split array in half, original Array after being sorted [1,2,3,4,5,6]
  - first_half = arr.slice(0...arr.size) [1,2,3]
  - second_half = arr.slice(arr.size..-1).reverse [4,5,6] after revise [6,5,4]

  - Array#map, Enumerable#with_index
  - Iterate through first_half
  - num * second_half[idx]
  - set return value of map as products

- return products.sum
=end

def min_sum(arr)
  ascending_nums = arr.sort

  first_half = ascending_nums[0...arr.size/2]
  second_half = ascending_nums[arr.size/2..-1].reverse

  products = first_half.map.with_index do |n, idx|
    n * second_half[idx]
  end

  products.sum
end

p min_sum([5,4,2,3]) == 22
p min_sum([12,6,10,26,3,24]) == 342
p min_sum([1,2]) == 2
p min_sum([]) == 0

# Other solutions
def min_sum(arr)
  arr = arr.sort
  sum = 0
    until arr.length == 0
    sum += (arr.pop * arr.shift)
    end
    sum
end

def min_sum(arr)
  arr.sort!
  (0...arr.size/2).map { |i| arr[i] * arr[-i-1] } .sum
end