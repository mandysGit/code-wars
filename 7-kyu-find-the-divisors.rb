=begin
https://www.codewars.com/kata/544aed4c4a30184e960010f4/train/ruby

Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime'.

Problem:
- Given an Integer > 1
- Create a set of all of the integer's divisors, except for 1 and the number
- The set should be ordered from smallest to largest
- If the set is empty, the integer is prime, return a String "#{num} is prime"

Algo:
- Use Range, 2...input Integer
- Use Array#select to loop over every number that's between 2 and one less than input Integer 
- Input Integer MOD current number == 0
- initialize divisors as the return value of the select method

return "#{input integer} is prime"
return divisors
=end

def divisors(n)
  divisors = (2...n).select do |num|
    n % num == 0
  end

  return "#{n} is prime" if divisors.empty?
  divisors
end


p divisors(12) == [2,3,4,6]
p divisors(25) == [5]
p divisors(13) == "13 is prime"