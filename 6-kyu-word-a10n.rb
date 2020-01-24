=begin
https://www.codewars.com/kata/5375f921003bf62192000746/train/ruby

The word i18n is a common abbreviation of internationalization in the developer community, used instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

Write a function that takes a string and turns any and all "words" within that string of length 4 or greater into an abbreviation, following these rules:

A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").

The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "elephant ride" => "e6t r2e").

Example

abbreviate("elephant-rides are really fun!")
//          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
// words (^):   "elephant" "rides" "are" "really" "fun"
//                123456     123     1     1234     1
// ignore short words:               X              X

// abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
// all non-word characters (*) remain in place
//                     "-"      " "    " "     " "     "!"
=== "e6t-r3s are r4y fun!"

Input: String of words, delimited by - , or .
Output: String, abbreviated words, delimited by - , .

Problem:
- Given a string of words
- Abbreviate each word into i18n version
- Return a String of all the abbreviated words

Rules:
- only abbreviate words that are length 4 or greater

Algo:
- create an Array of words and it's delimiters ['double', '-', 'barrel']
- initialize word = ''
- result = []

- Iterate through the String, use String#each_char
  - IF char is punctuations or space
    - result << word
    - result << char
    - word = ''
  - IF char is letter
    - word << char
    
- if !word.empty? result << word
  
- Change each word to it's i18n
  - Use Array#map
  - If word.length > 4
    - return translate(word)
  - ELSE
    - return word
  
- arr.join 

- subprocess that translates the word to i18n
  - given word
  - first = word[0]
  - last = word[-1]
  - middle = word.size -2
  - "#{first}#{middle}#{last}"
=end

def translate(word)
  "#{word[0]}#{word.size - 2}#{word[-1]}"
end

def abbreviate(str)
  word = ''
  result = []
  
  str.each_char do |char|
    if ',.- '.include?(char)
      result << word
      result << char
      word = ''
    else
      word << char
    end
  end
  
  result << word if !word.empty?
  result.delete('')
  
  final = result.map do |word|
    if word.length > 3
      translate(word)
    else
      word
    end
  end
  
  final.join
end

# p translate('banana') == "b4a"
# p translate('speak') == "s3k"

p abbreviate("banana") == "b4a"
p abbreviate("double-barrel") == "d4e-b4l"
p abbreviate("You, and I, should speak.") == "You, and I, s4d s3k."