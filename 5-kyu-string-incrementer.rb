=begin
https://www.codewars.com/kata/54a91a4883a7de5d7800009c/train/ruby
Your job is to write a function which increments a string,
to create a new string.

If the string already ends with a number, the number should
be incremented by 1.

If the string does not end with a number. the number 1 should
be appended to the new string.

Attention: If the number has leading zeros the amount of
digits should be considered.

Problem: 
- Given a String, that contains letters and numbers
- If string is empty return "1"
- If string does not end with a number, append 1 to it
- Divide the string up into 3 parts
  - only letters
  - zeros
  - digits from 1-9 inclusive
  
- Compare the length of (zeros + digits incremented by 1) with original (zero + digits) 
  - In order to see if I need to take off a zero

- Keep count of the zeros
- Keep count of the original (zero + digits) length
- Increment the digits by 1

- After I get the final digits from taking off a zero or not
- Append it to the letters
- return the letters + digits 

Input: String
Output: String

Algo:
- initialize ALPHA constant = ('a'..'z').to_a
- initialize DIGITS = '123456789'
- initialize result = ''
- If string is empty return "1"
- If string does not end with a number, append 1 to it

- Convert the String into an Array, String#chars
- initialize letters = Array#Select, inside the block, ALPHA.include?(char.downcase)
- initialize zeros = Array#Select, inside the block, if char.to_i.zero?
- initialize digits = Array#Select, inside the block, DIGITS.include?(char)

- initialize length_of_zeros = zeros.length
- initialize length_of_zeros_and_digits = zeros.length + digits.length

Increment the digits by 1
- initialize incremented_digits = digits.join.to_i + 1

Figure out the length of (zeros + digits incremented by 1)
- initialize length_of_zeros_and_digits_plus_one = length_of_zeros + incremented_digit.to_s.length

IF length_of_zeros_and_digits_plus_one ==  length_of_zeros_and_digits
  result << letters.join << zeros.join << incremented_digits.to_s
ELSE
  result << letters.join << zeros.pop.join << incremented_digits.to_s

return result
=end


ALPHA = ('a'..'z').to_a
DIGITS = '123456789'

def increment_string(str)
  result = ''
  
  return '1' if str.empty? 
  return str + '1' if ALPHA.include?str[-1]

  arr = str.chars
  letters = arr.select { |char| ALPHA.include?(char.downcase) }
  zeros = arr.select { |char| char == '0' }
  digits = arr.select { |char| DIGITS.include?(char) }
  
  length_of_zeros = zeros.length
  length_of_zeros_and_digits = zeros.length + digits.length
  incremented_digits = digits.join.to_i + 1
  length_of_zeros_and_digits_plus_one = length_of_zeros + incremented_digits.to_s.length
  
  if length_of_zeros_and_digits_plus_one ==  length_of_zeros_and_digits
    result << letters.join << zeros.join << incremented_digits.to_s
  else
    zeros.pop
    result << letters.join << zeros.join << incremented_digits.to_s  
  end

  result 
end


p increment_string("foo") == "foo1"
p increment_string("foo9")       == "foo10"
p increment_string("foo099") == "foo100"
p increment_string("foo00099")   == "foo00100"
p increment_string("foobar23")   == "foobar24"
p increment_string("foobar0042") == "foobar0043"
p increment_string("foobar001")  == "foobar002"
p increment_string("foobar1")    == "foobar2"
p increment_string("foobar00")   == "foobar01"
p increment_string("foobar99")   == "foobar100"
p increment_string("") == "1"

