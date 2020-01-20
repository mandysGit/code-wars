=begin
https://www.codewars.com/kata/58aa68605aab54a26c0001a6

The year of 2013 is the first year after the old 1987 with only distinct digits.

Problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

[input] integer year
1000 ≤ year ≤ 9000

[output] an integer

The minimum year number that is strictly larger than the input number year and all its digits are distinct.

Problem:
- Given a year number
- Find the minimum year larger than the given year that has all unique digits
  - Increment the year by 1 to get a new year
  - Check new year for unique digits 

Input: Integer
Output: Integer

Algo:
- initialize given_year = year
- initialize distinct_year = ''
- initialize distinct_year_found = false

- Use Kernel#loop
  - break if distinct_year_found is TRUE
  - increment given_year by 1

  - validate if given_year is distinct by comparing lengths of digits after removing duplicates
    - IF given_year.digits.size == given_year.digits.uniq.size
    - distinct_year_found = true
    - distinct_year = given_year.to_s
  
- return distinct_year.to_i
=end

# def distinct_digit_year(year)
#   given_year = year
#   distinct_year = ''
#   distinct_year_found = false

#   loop do
#     break if distinct_year_found == true
#     given_year += 1

#     if given_year.digits.size == given_year.digits.uniq.size
#       distinct_year_found = true
#       distinct_year = given_year.to_s
#     end
#   end

#   distinct_year.to_i
# end

# Refactored
def distinct_digit_year(year)
  distinct_year_found = false

  loop do
    break if distinct_year_found == true
    year += 1

    if year.digits.size == year.digits.uniq.size
      distinct_year_found = true
    end
  end

  year
end

p distinct_digit_year(1987) == 2013
p distinct_digit_year(2013) == 2014
p distinct_digit_year(2229) == 2301

# Other solutions
def distinct_digit_year(year)
  year += 1
  year += 1 until year.digits.uniq  == year.digits
  year 
end