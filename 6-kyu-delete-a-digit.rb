=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example:
For n = 152, the output should be 52;
For n = 1001, the output should be 101.

Input/Output:
- [input] integer n
- Constraints: 10 ≤ n ≤ 1000000.
- [output] an integer

Problem:
- Given an Integer
- Create a set of numbers where one number is deleted
  - Delete one number in that integer
- Compare all of those numbers to find the maximum
- Return the max number

Algo:
- initialize numbers = []
- convert input integer to an Array, use Integer#to_s , String#chars
- Iterate through the Array, use Array#each_with_index
- Use Array#delete_at the current element by using it's idx
- Append the temp Array to the numbers

- Return numbers.max
=end

def delete_digit(n)
  numbers = []

  n.to_s.chars.each_with_index do |_, idx|
    temp = n.to_s.chars
    temp.delete_at(idx)
    numbers << temp.join.to_i
  end

  numbers.max
end

  
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1