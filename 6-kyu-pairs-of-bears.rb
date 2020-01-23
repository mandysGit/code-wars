=begin
- The wilderness zoo needs to prove it has x number of mating pairs of bears.
- check within string (s) to find all of the mating pairs
- return a string containing only them.

Rules:
- 'B' (male) or '8' (female)
- pairs 'B8' or '8B'
- Mating pairs must involve two distinct bears
- ('B8B' may look fun, but does not count as two pairs).

Output: 
- An array containing a string mating pairs available and boolean
- true if the number is more than or equal to x, false if not

Problem: 
- Given an Integer and a String
- Integer is a number of mating pairs to meet requirement
- Find all mating pairs in the String 'B8' or '8B'
- Return a string containing only the mating pairs
- Once I have a string containing the mating pairs, count the pairs
- compare the number of the actual pairs with the input Integer

Input: Integer and a String
Output: An Array, contains String and boolean 

Algo:
- subprocess: find_pairs (8B or B8)
  - initialize counter = 1
  - initialize pairs ''
  
  - Iterate through the String, until counter >= string.size  
    - IF preivous_char + current_char is either '8B' or 'B8'
      - append the pair to pairs 
      - increment counter by 2 to avoid the 'B8B' situation
      - next
    - counter += 1
  
  -return pairs
  
- subprocess: count_pairs
  - Use String#size on find_pairs(str) 
  - Divide the size by 2

- return result = [find_pairs(str), count_pairs(str) >= input integer]

=end

def find_pairs(str)
  pairs = ''
  counter = 1
  
  until counter >= str.size
    if (str[counter-1] + str[counter] == '8B') || (str[counter-1] + str[counter] == 'B8')
      pairs << str[counter-1] + str[counter]
      counter += 2
      next
    end
    counter += 1
  end

  pairs
end

def count_pairs(str)
  find_pairs(str).size / 2
end

def bears(num, str)
  [find_pairs(str), count_pairs(str) >= num ]
end


# p find_pairs('8j8mBliB8gimjB8B8jlB') == "B8B8B8"
# p find_pairs('8j8mBliB8gimjB8B8jlB') == "B8B8B8"
# p find_pairs('88Bifk8hB8BB8BBBB888chl8BhBfd') == "8BB8B8B88B"
# p find_pairs('8') == ''
# p find_pairs('j8BmB88B88gkBBlf8hg8888lbe88') == "8BB88B"
# p find_pairs('8j888aam') == ''

p bears(7, '8j8mBliB8gimjB8B8jlB') == ["B8B8B8",false]
p bears(3, '88Bifk8hB8BB8BBBB888chl8BhBfd') == ["8BB8B8B88B",true]
p bears(8, '8') == ["",false]
p bears(1, 'j8BmB88B88gkBBlf8hg8888lbe88') == ["8BB88B",true]
p bears(0, '8j888aam') == ["",true]

# Alternative solution
def bears(x,s)
  bears = s.scan(/(8B|B8)/)
  [bears.join, bears.size >= x]
end