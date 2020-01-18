=begin
Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

Problem: Given a String, change each word by moving the first letter to the end of the word and appending "ay"
Rules: puncutations are untouched.

Input: String, words and punctuations
Output: String, pig latin words and punctuations

Algo:
- Use String#split to convert the Input String to an Array with each element as word
- Iterate through the Array, perform transformation on Array, each word is transformed to pig_latin word
- Use Array#map
  - IF word.match?(/[^A-Za-z]/) to check that it's only alpha characters
    - return pig_latin(word)
  - ELSE, word is punctuation
    - return word
- Use Array#join(' ') on the return value of map

- subprocess: pig_latin
- takes in one argument, String
- initialize pig latin word as 2nd character until last character. word[1..word.size - 1] + word[0]
- word << "ay"
- return word


=end
# def pig_latin(word)
#   pig_latin_word = word[1..word.size - 1] + word[0]
#   pig_latin_word << 'ay'
# end

# def pig_it(text)
#   array = text.split.map do |word|
#     if word.match?(/[A-Za-z]/)
#       pig_latin(word)
#     else
#       word
#     end
#   end

#   array.join(' ')
# end

# test cases
# p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
# p pig_it('Hello world !') == 'elloHay orldway !'

# Refactored
def pig_it(text)
  text.split.map do |word|
    if word.match?(/[A-Za-z]/)
      word[1..word.size - 1] + word[0] + 'ay'
    else
      word
    end
  end.join(' ')
end

# p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
# p pig_it('Hello world !') == 'elloHay orldway !'

# no regex
lowercase = ('a'..'z').to_a
uppercase = ('A'..'Z').to_a
ALPHA = lowercase.concat(uppercase)

def pig_it(text)
  text.split.map do |word|
    if word.chars.all? {|char| ALPHA.include?(char) }
      word[1..word.size - 1] + word[0] + 'ay'
    else
      word
    end
  end.join(' ')
end

p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pig_it('Hello world !') == 'elloHay orldway !'

# read question carefully
# Read Error Messages CAREFULLY, and read it outloud
# Array#concat
# Regex Alpha /[A-Za-z]/
# /[^A-Za-z]/ This checks if the character is neither an uppercase letter nor a lowercase letter.
# You can chain Array#join at the end
# study String#gsub
# Try to use major regex pattherns for:
# alpha, digits, non-alpha, non-digits