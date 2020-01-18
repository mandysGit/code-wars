=begin
Given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.
Example

alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

Problem: Parse the String, and replace alpha characters with its position in alphabet
Rules: Ignore non-alpha characters

Input: String
Output: String of numbers/position in alphabet

Algo:
- initialize ALPHA constant as ('a'..'z').to_a
- initialize result as empty array 
- Use String#chars to convert string to array
- each array element is a character
- Iterate through the array, Use Array#each
- If character.match?(/A-Za-z/) (If it's an alpha character)
  - result << ALPHA.index(char) + 1

- Convert Array back to String, Use array.join(' ') on result
- return result
=end 
ALPHA = ('a'..'z').to_a

def alphabet_position(str)
  result = []
  str.chars.each do |char|
    result << ALPHA.index(char.downcase) + 1 if char.match?(/[A-Za-z]/)
  end
  result.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"


def alphabet_position(str)
  result = []
  str.chars.each do |char|
    result << ('a'..'z').to_a.index(char.downcase) + 1 if char.match?(/[A-Za-z]/)
  end
  result.join(' ')
end

# Be very careful with the regex, char.match?(/[A-Za-z]/)
# I had forgotten to put [] and instead had (/A-Za-z/)