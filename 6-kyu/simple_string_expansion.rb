=begin
Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. 

Rules: 
- no numeric characters in the final string
- Empty strings should return an empty string
- The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears
- If there are two consecutive numeric characters the first one is ignored
- If there are two consecutive alphabetic characters then the first character has no effect on the one after it
- Your code should be able to work for both lower and capital case letters.

Problem: Given a string return a new string with the number of characters corresponding to the preceding numeric value. 
Input: 
=end

p string_expansion('3abc') == 'aaabbbccc'         # true
p string_expansion('abcde') == 'abcde'            # true
p string_expansion('3D2a5d2f') == 'DDDaadddddff'  # true
p string_expansion('3d332f2a') == 'dddffaa'       # true
p string_expansion('') == ''                      # true
p string_expansion('3abc') != 'aaabc'           # false
p string_expansion('3abc') != 'abcabcabc'       # false