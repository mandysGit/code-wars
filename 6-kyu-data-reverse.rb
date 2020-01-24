=begin
https://www.codewars.com/kata/569d488d61b812a0f7000015/train/ruby

A stream of data is received and needs to be reversed.

Each segment is 8 bits long, meaning the order of these segments needs to be reversed, for example:

11111111  00000000  00001111  10101010
 (byte1)   (byte2)   (byte3)   (byte4)

should become:

10101010  00001111  00000000  11111111
 (byte4)   (byte3)   (byte2)   (byte1)

The total number of bits will always be a multiple of 8.

The data is given in an array as such:

[1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]

Problem: 
- Given an Array of 0's and 1's
- each byte is 8 numbers
- reverse the order of bytes

Input: Array
Output: Array, with bits in reverse order

Algo:
- Create a new Array, 2D array, that holds every byte in an inner Array
- initialize result = []
- initialize counter = 1
- initialize inner_array = []

- Iterate through input array, use Array#each
  - inner_array << num
  - increment counter
  - IF counter == 8
    - 2D_arry << inner_array
    - reassign counter = 0
    - reassign inner_array as empty array

- 2D_array reverse, use ARray#reverse
- convert 2D_array to 1D_Array by using Array#Flatten
- return the 1D_Array
=end

def data_reverse(arr)
  result = []
  counter = 0
  inner_array = []
  
  arr.each do |bit|
    inner_array << bit
    counter += 1
    
    if counter == 8
      result << inner_array
      counter = 0
      inner_array = []
    end
  end
  
  result.reverse.flatten
end


p data_reverse([1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0]) == [1,0,1,0,1,0,1,0, 0,0,0,0,1,1,1,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1] 

p data_reverse([0,0,1,1,0,1,1,0, 0,0,1,0,1,0,0,1]) == [0,0,1,0,1,0,0,1, 0,0,1,1,0,1,1,0] 