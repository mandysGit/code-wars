=begin
Given a number n, return the number of positive odd numbers below n, EASY! Expect large Inputs!

Problem:
- Given a number n
- Count the number of positive odd numbers below n
- Return Count

Input: Integer
Output: Integer
=end

def oddCount(n)
  (1...n).select { |num| num.odd? }.size
end

def oddCount n 
  n/2
end

p oddCount(7) == 3 # [1, 3, 5]
p oddCount(15) == 7 # [1, 3, 5, 7, 9, 11, 13]