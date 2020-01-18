=begin
https://www.codewars.com/kata/5aaae0f5fd8c069e8c00016e

Given an array of words and a target compound word,
your objective is to find the two words which combine into the target word,
returning both words in the order they appear in the array,
and their respective indices in the order they combine to form the target word.
Words in the array you are given may repeat,
but there will only be one unique pair that makes the target compound word.

If there is no match found, return null/nil/None.

Note: Some arrays will be very long and may include duplicates, so keep an eye on efficiency.

Problem: 
- Given an Array of words and a String, one word
- Find the two words that make up the String word
    - Find if word in the array is part of the input string
- Save the indexes of those words that make up the string word
- Return the two words as strings in the order you found it
- Return the two indexes in the order that creates the word 

Algo: 
- initialize result = []
- initialize combination = arr.combination(2).to_a  to get all the unique pairs

- Find the pair in combination that make up the input string
  - Iterate through combination
  - IF combination.join equals string word
    - result << combo[0] << combo[2]
    - result << arr.index(combo[0]) << arr.index(combo[1])
    - break

- Return result
=end

def fn(arr, str)
  result = []
  combination = arr.combination(2).to_a

  combination.each do |combo|
    if combo.join == str
      result << combo[0] << combo[1]
      result << [arr.index(combo[0]), arr.index(combo[1])]
      break
    elsif combo.reverse.join == str
      result << combo[0] << combo[1]
      result << [arr.index(combo[1]), arr.index(combo[0])]
      break
    end
  end

  result
end


p fn(['super','bow','bowl','tar','get','book','let'], "superbowl")      ==  ['super','bowl',   [0,2]]
p fn(['bow','crystal','organic','ally','rain','line'], "crystalline")   ==  ['crystal','line', [1,5]]
p fn(['bow','crystal','organic','ally','rain','line'], "rainbow")       ==  ['bow','rain', [4,0]]
p fn(['bow','crystal','organic','ally','rain','line'], "organically")   ==  ['organic','ally', [2,3]]
p fn(['top','main','tree','ally','fin','line'], "mainline")             ==  ['main','line',    [1,5]]
p fn(['top','main','tree','ally','fin','line'], "treetop")              ==  ['top','tree',     [2,0]]