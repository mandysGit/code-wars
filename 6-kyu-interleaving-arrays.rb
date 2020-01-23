=begin
https://www.codewars.com/kata/523d2e964680d1f749000135
Create a method that accepts an arbitrary number of arrays and returns a single array generated by alternately appending elements from the passed in arguments. If one of them is shorter than the others, the result should be padded with nils.

Problem:
- Given n Arrays
- Create a new Array, append elements to the new Array from each input Array
  - sort the Array by array length
  - Find the last index of the longest Array
- Based on the last idx of the Array, Loop all the Arrays and append the elements to the new Array
- If idx is out of bounds for shorter Arrays, Append nil

Algo:
- initialize result = []
- Use Enumberable#sort_by Array length (shortest to longest)
- initialize upper_idx as the last array's length - 1
- Use Integer#upto, to iterate from 0 up to and including the upper_idx
- Use Array#each, to get each inner_arr
- reference each inner_arr by current idx of the loop
- append inner_arr[idx] to result
=end

def interleave(*arr)
  return [] if [*arr].empty?
  result = []
  sorted_arr = [*arr].sort_by { |arr| arr.length }
  upper_idx = sorted_arr[-1].length - 1

  0.upto(upper_idx) do |idx|
    [*arr].each do |inner_arr|
      result << inner_arr[idx]
    end
  end

  result
end
# p interleave([1, 2, 3], ["c", "d", "e"]) == [1, "c", 2, "d", 3, "e"]
p interleave([1, 2, 3], [4, 5]) == [1, 4, 2, 5, 3, nil]
# p interleave([1, 2, 3], [4, 5, 6], [7, 8, 9]) == [1, 4, 7, 2, 5, 8, 3, 6, 9]
# p interleave([]) == []