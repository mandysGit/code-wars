=begin
Given a string that includes alphanumeric characters ('3a4B2d')
return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. 

Rules: 
- no numeric characters in the final string
- Empty strings should return an empty string
- The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
- If there are two consecutive numeric characters the first one is ignored
- If there are two consecutive alphabetic characters then the first character has no effect on the one after it
- Your code should be able to work for both lower and capital case letters.

Problem: 
- Given a string that contains numbers and letters
- create a new string with repeating letters based on the preceding numeric value
    - store the occurence of the num in a variable
    - multiply the letters by the num
- Return the new string

Input: String, numbers and letters
Output: String, only letters

Algo:
- initialize n = 1
- initialize result as empty string

- Use String#each_char to iterate through every character
- If char == a number
  - n = char
- ELSE
  - result << 'char'*n

return result
=end

def string_expansion(str)
  n = 1
  result = ''

  str.each_char do |char|
    if "1234567890".include?(char)
      n = char.to_i
    else 
      result << char*n
    end
  end

  result
end

p string_expansion('3abc') == 'aaabbbccc'        
p string_expansion('abcde') == 'abcde'           
p string_expansion('3D2a5d2f') == 'DDDaadddddff' 
p string_expansion('3d332f2a') == 'dddffaa'      
p string_expansion('') == ''                     
p string_expansion('3abc') != 'aaabc'           
p string_expansion('3abc') != 'abcabcabc'       