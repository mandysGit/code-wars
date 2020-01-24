=begin
https://www.codewars.com/kata/55c45be3b2079eccff00010f/train/ruby

Your task is to sort a given string. Each word in the string will contain a single number.
This number is the position the word should have in the result.

Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.

Problem:
- Given a String of words, each word contains a numeric character
- Sort the given string by the numeric character
- number represents the position the word should be in

Rules:
- positions start at 1
- If input is empty string, return empty string

Input: String
Output: String, sorted

Algo:
- use String#split to convert input string to Array of words
- initialize sorted = []

- Iterate through the Array of words, use Array#each
  - position = get_number(word) 
  - sorted[position] = word

- sorted.join(' ')

subprocess: get_number(word)
- initialize nums = '0123456789'
- Use String#chars to iterate through each character
- if nums.include?(char)
- return char.to_i
=end

def get_number(word)
  nums = '0123456789'
  word.each_char do |char|
    return char.to_i if nums.include?(char)
  end
end

def order(str)
  sorted = []
  
  str.split.each do |word|
    position = get_number(word)
    sorted[position - 1] = word
  end
  
  sorted.join(' ' )
end

# p get_number('is2') == 2
# p get_number('Thi1s') == 1
# p get_number('T4est') == 4

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""

#refactored
def order(str)
  sorted = []
  
  str.split.each do |word|
    position = word.slice(/\d/).to_i
    sorted[position - 1] = word
  end
  
  sorted.join(' ' )
end