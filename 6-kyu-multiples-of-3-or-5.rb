=begin
https://www.codewars.com/kata/514b92a657cdc65150000006/ruby
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

Problem:
- Given a natural number (Integer)
- Create a set of multiples of 3 or 5 that are below that number
- sum all the multiples

Rules: 
- Only count multiple once, if it's a multiple of both 3 and 5

Algo:
- initialize multiples = []

- Create a set of multiples
  - Use Integer#upto, 1.upto(number - 1) to loop through nums 1 to one below number
  - IF num % 3 == 0 || num % 5 == 0
    - append num to multiples, Use Array#<<

- return multiples.sum
=end


def solution(number)
  multiples = []

  1.upto(number - 1) do |num|
    multiples << num if num % 3 == 0 || num % 5 == 0
  end

  multiples.sum
end

 p solution(10) == 23
 p solution(20) == 78
 p solution(200) == 9168

 # Alternative solution
 def solution(number)
  (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)
end