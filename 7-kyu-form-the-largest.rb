=begin
https://www.codewars.com/kata/5a4ea304b3bfa89a9900008e

Given a number, Return The Maximum number that could be formed from the digits of the number given.

Notes:
- Only Natural numbers passed to the function, numbers Contain digits [0:9] inclusive
- Digit Duplications could occur, So also consider it when forming the Largest

Problem:
- Given a number
- Rearrange the numbers to create the maxium number that can be formed with the digit
  - The largest numbers are on the left, and the numbers following it will be equal or less 

Algo: 
- use Integer#digits on the input number to Create an Array
- Array#sort by descending order. b <=> a
- After sorting, Convert Array of digits back to a single number
- Array#join, String#to_i
=end

def max_number(n)
  numbers_descending = n.digits.sort { |a, b| b <=> a }
  numbers_descending.join.to_i
end

p max_number(213) == 321
p max_number(7389) == 9873
p max_number(63729) == 97632
p max_number(566797) == 977665
p max_number(17693284) == 98764321