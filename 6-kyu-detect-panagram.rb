=begin
https://www.codewars.com/kata/545cedaa9943f7fe7b000048/ruby

A panagram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a panagram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a panagram. Return True if it is, False if not. Ignore numbers and punctuation.

Problem:
- Given a string
- check if the string is a panagram
- panagram is sentence that contains every letter in the alphabet
- return true or false

Input: String, may contain numbers and letters
Output: Boolean

Algo:
- initialize alphabet = ('a'..'z').to_a
- Check every character of the string, if it appears in the alphabet

- Iterate through the string, use String#each_char
  - use Array#delete!(char) for alphabet array

- alphabet.empty?
=end

def panagram?(str)
  alphabet = ('a'..'z').to_a

  str.each_char { |char| alphabet.delete(char.downcase) }
  
  alphabet.empty?
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false